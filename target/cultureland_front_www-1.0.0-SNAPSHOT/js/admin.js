
Lpad=function(str, len) { 
    str = str + ""; 
      while(str.length < len) { 
      str = "0"+str; 
    } 
	return str; 
} 

// 사용자로부터 마우스 또는 키보드 이벤트가 없을경우의    자동로그아웃까지의 대기시간, 분단위 
 var iMinute = 20; 
  
 //자동로그아웃 처리 몇초전에 경고를 보여줄지 설정하는 부분, 초단위 
 var noticeSecond = 300; 

 var iSecond = iMinute * 60 ; 
 var timerchecker = null; 
  
 
 

//- Register Event Listener For FireFox *-

if( navigator.userAgent.indexOf('Firefox') >= 0 ) {	

	var eventNames = [ "mousemove",    "click", "keypress" ]; 
		
	for( var i = 0 ; i < eventNames.length; i++ ) {
		window.addEventListener( eventNames[i], function(e) {
			
			iSecond = iMinute * 60 ; 
			clearTimeout(timerchecker); 
			$("#coverFilmMain").get(0).style.visibility='hidden'; //// 입력방지 레이어 해제 
			$("#timer").get(0).style.visibility='hidden';  /// 자동로그아웃 경고레이어 해제 
			
			$("#loginCheckLayer").hide();
			
			
			window.event = e;
		}, true );
	}
}


 initTimer=function(){ 
    //사용자부터 마우스 또는 키보드 이벤트가 발생했을경우       자동로그아웃까지의 대기시간을 다시 초기화 
    	
    try{
    	
    
    if(window.event  ){
    	if( navigator.userAgent.indexOf('Firefox') >= 0 ) {  // 파폭용 이벤트는 위에 따로 셋팅함
    		
    	}else{
    	
			iSecond = iMinute * 600000 ; 
			clearTimeout(timerchecker); 
			$("#coverFilmMain").get(0).style.visibility='hidden'; //// 입력방지 레이어 해제 
			$("#timer").get(0).style.visibility='hidden';  /// 자동로그아웃 경고레이어 해제 
			
			$("#loginCheckLayer").hide();
			
    	
    
 		}
    } 
	rMinute = parseInt(iSecond / 60); 
	rSecond = iSecond % 60;  

	
	//지정한 시간동안 마우스, 키보드 이벤트가 발생되지 않았을 경우 
    if(iSecond < noticeSecond){ 
    	$("#coverFilmMain").get(0).style.visibility='visible'; /// 입력방지 레이어 활성 
        $("#timer").get(0).style.visibility='visible';  /// 자동로그아웃 경고레이어 활성 
        $("#loginCheckLayer").show();
     } 




		if(iSecond > 0){ 
			
		    //자동로그아웃 경고레이어에 경고문+남은 시간 보여주는 부분 
		   $("#timer").html("<font family=tahoma style='font-size:70;'>자동 로그아웃 남은 시간 </font>   </h1> <font color=red>" + Lpad(rMinute, 2)+":"+Lpad(rSecond, 2)) ; 
		    //iSecond--;
		    iSecond = iSecond -1;

		    timerchecker = setTimeout("initTimer()", 1000); // 1초 간격으로 체크 
		    
		}else{
			$("#timer").html("<font family=tahoma style='font-size:70;'>자동 로그아웃 남은 시간 </font>   </h1> <font color=red>00:00") ;
			
		    clearTimeout(timerchecker); 
		    
		    alert("장시간 미사용으로 자동 로그아웃 처리되었습니다."); 
		    location.href = "<c:url value='/admin/logout.do'  />"; // 로그아웃 처리 페이지 
		} 
		
		
    }catch(e){ }
		
 }
 
 
 
onload = initTimer;                             //현재 페이지 대기시간 
document.onclick = initTimer;             // 현재 페이지의 사용자 마우스 클릭이벤트 
document.onkeypress = initTimer;      // 현재 페이지의 키보트 입력이벤트
document.onmousemove = initTimer; // 현재 페이지의 마우스 움직임 이벤트



function passwordMod(){
	
	$( "#dialog-password" ).dialog({
	      resizable: false,
	      height: "auto",
	      width: 450,
	      title: "비밀번호 변경",
	      modal: true,
	     
	      buttons: {
 
	        "수정": function() {
	        	
	        	fn_mod_password();
	        	
	        },
	        "취소": function() {	        	
	          	 $( this ).dialog( "close" );
	        }
	      }
	    });
}

function passwordUserMod(seq){
	
	$.ajax({
		type : "post",			
		url : "/admin/writeTemplate.do",
		dataType : 'html',
		data: $('form#passFrm').serialize() ,
		
		success : function(data) {
			$("#passwordForm").html(data);

			$( "#dialog-password" ).dialog({
			      resizable: false,
			      height: "auto",
			      width: 450,
			      title: "정보 수정",
			      modal: true,
			     
			      buttons: {

			        "비밀번호변경": function() {
			        	
			        	fn_user_mod_password(seq);
			        	
			        },
			        "저장": function() {
			        	
			        	fn_info_update(seq);
			        	
			        },
			        "취소": function() {	        	
			          	 $( this ).dialog( "close" );
			        }
			      }
			    });
		}
	});
	
//	$( "#dialog-password" ).dialog({
//	      resizable: false,
//	      height: "auto",
//	      width: 450,
//	      title: "정보 수정",
//	      modal: true,
//	     
//	      buttons: {
// 
//	        "비밀번호변경": function() {
//	        	
//	        	fn_user_mod_password(seq);
//	        	
//	        },
//	        "수정": function() {
//	        	
//	        	fn_info_update(seq);
//	        	
//	        },
//	        "취소": function() {	        	
//	          	 $( this ).dialog( "close" );
//	        }
//	      }
//	    });
}


function fn_mod_password(){
	
	
	var returnStr = true;
	
	if ( returnStr && trimNvl( $("#cur_pwd").val() )){
		alert('현재 비밀번호를 입력해주세요.');
		$("#cur_pwd").focus();
		returnStr=false;
	}
	
	if ( returnStr && trimNvl( $("#chg_pwd").val() )){
		alert('변경할 비밀번호를 입력해주세요.');
		$("#chg_pwd").focus();
		returnStr=false;
	}
	
	if ( returnStr && trimNvl( $("#chg_pwd_re").val() )){
		alert('확인 비밀번호를 입력해주세요.');
		$("#chg_pwd_re").focus();
		returnStr=false;
	}
	
	
	if (returnStr && confirm("비밀번호를 변경 하시겠습니까?")){
		
		
		$.ajax({
			type : "post",
			async : true,
			url : "/admin/passwordMod.json",
			data: $('#passFrm').serialize() ,
			
			success : function(data) {
								
				if(data.success){
					
					alert('변경 하였습니다.');
					$("#dialog-password").dialog( "close" );
					
				}else{
					if ( data.message != ""){
						alert(data.message);
					}else{
						alert('저장하는 도중 실패 하였습니다.\n새로 고침 후에 다시 시도해 주세요.');
					}
				}
				
			}
		});
		
		
	}
	
}

function fn_info_update(seq){
	
	
	var returnStr = true;
	
	if(  returnStr  &&  trimNvl( $("#name").val() )){
		alert('이름을 입력해 주십시요');
		$('#name').focus();
		returnStr = false;
	}
	
	
	if (returnStr && confirm("정보 수정 하시겠습니까?")){
		
		document.passFrm.seq.value = seq;
		
		document.passFrm.tel.value = document.passFrm.tel1.value + '-' + document.passFrm.tel2.value + '-' + document.passFrm.tel3.value;
		document.passFrm.cellphone.value = document.passFrm.phone1.value + '-' + document.passFrm.phone2.value + '-' + document.passFrm.phone3.value;
			
		$.ajax({
			type : "post",
			async : true,
			url : "/admin/account/write_proc.json",
			data: $('#passFrm').serialize() ,
			
			success : function(data) {
				
				if(data.success){
					
					alert('변경 하였습니다.');
					$("#dialog-password").dialog( "close" );
					
				}else{
					if ( data.message != ""){
						alert(data.message);
					}else{
						alert('저장하는 도중 실패 하였습니다.\n새로 고침 후에 다시 시도해 주세요.');
					}
				}
				
			}
		});
		
		
	}
	
}



function getHTML(id) {
	return sHTML = oEditors.getById[id].getIR();
	
}

function pwEncode(id, pw) {
	return id +"!!sa@"+ pw;
}