/**  <!--
 * 익스 6,7,8 을 위한 스크립트
 * 
 */
var console = console || {
    log:function(){},
    warn:function(){},
    error:function(){}
};





//리스트에서 전자정부 파일다운로드 호출
function fn_ListdownFile(atchFileId, fileSn){
	fn_ListdownFileUser(atchFileId, fileSn);
	setTimeout(function(){ window.location.reload(); }, 500);	// 관리자는 현재창 새로고침
}

function fn_ListdownFileUser(atchFileId, fileSn){
	window.open("/cmm/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn);
}


//전자정부 파일업로드 관련
function fn_egov_file_name(){
	
	var parentDiv = $("input[type=file]").parent();
	if ( typeof( parentDiv.attr("id")) == "undefined"){
		parentDiv = parentDiv.parent();
	}
	
	// 그래도 없으면 한번 더
	if ( typeof( parentDiv.attr("id")) == "undefined"){
		parentDiv = parentDiv.parent();
	}
	
	parentDiv.each(function(){
		var data_name = $(this).attr("id");
		
		$(this).find("input[type=file]").each(function(){
			var thisName = data_name;			
			if ($(this).is(":disabled")){
				//$(this).remove();
			}else{
				$(this).attr("name" , thisName);
			}
		});
	});
	
}





//중분류별 옵션 입력창 컨트롤
function fn_opt(opt){
	
		$(".op").hide();
		
		try{
			var optArr = opt.split('\|');
			var cnt = 0;
			for(var i=0;i<(optArr.length-1) ;i++){
				
				$("#op"+(i+1)+"_str").text(optArr[i]);
				if ( !trimNvl(optArr[i]) ){
					//$(".op").eq(i).show();
					$(".op"+(i+1)).show();
					cnt++;
				}else{
					$(".op"+(i+1)).remove();
				}
				
			}
		}catch(e){
		}
	

}






// 익스 버젼 체크
function get_version_of_IE() { 

	 var word; 
	 var version = "N/A"; 

	 var agent = navigator.userAgent.toLowerCase(); 
	 var name = navigator.appName; 

	 // IE old version ( IE 10 or Lower ) 
	 if ( name == "Microsoft Internet Explorer" ) word = "msie "; 

	 else { 
		 // IE 11 
		 if ( agent.search("trident") > -1 ) word = "trident/.*rv:"; 

		 // IE 12  ( Microsoft Edge ) 
		 else if ( agent.search("edge/") > -1 ) word = "edge/"; 
	 } 

	 var reg = new RegExp( word + "([0-9]{1,})(\\.{0,}[0-9]{0,1})" ); 

	 if (  reg.exec( agent ) != null  ) version = RegExp.$1 + RegExp.$2; 

	 return version; 
} 


function IECheck(){
	var returnStr=false;
	var agent = navigator.userAgent.toLowerCase(); 
	
	 // IE old version ( IE 10 or Lower ) 
	if ( name == "Microsoft Internet Explorer" ) {
		returnStr=true;
		
	// IE 11 
	}else if(agent.search("trident") > -1 ){
		returnStr=true;
		
		// IE 12  ( Microsoft Edge ) 	
	}else if( agent.search("edge/") > -1 ){
		returnStr=true;
		
	}


	
	return returnStr;
}

/**
 * 익스 6,7,8 을 위한 숫자만 입력 스크립트
 * 설명 :  익스6,7,8 과 크롬, 파폭이 동일하게 작동하기 위한 스크립트 
 * 사용법 : <input type="text"  numberonly="true" onkeypress="isNUM()"   maxlength="9"/>
 */
$(function(){

	// html type=number  용 스크립트
	$("input[type='number']").keypress(function(evt){		
		var code = evt.which?evt.which:event.keyCode;
		if(code < 48 || code > 57){
			return false;
		}
		
	}).on('input',   function(){
		try{
			if ($(this).val().length > $(this).attr("maxlength")){
				$(this).val( $(this).val().slice(0, $(this).attr("maxlength")) );
		    }
		}catch(e){}
		
	});
	
	 $(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
	 $(document).on("keyup", "input:text[datetimeOnly]", function() {$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );});

	 
	 $("input:text[numberOnly]").keypress(function(evt){		
			var code = evt.which?evt.which:event.keyCode;
			if(code < 48 || code > 57){
				return false;
			}
			
	});
	 
	 ///              ------>
	 
	 
	 
	 //  글자수 실시간 체크
	 $("input[type=text][charCount] , textarea[charCount]").keypress(function(evt){
		 charCount($(this));
	 }).focus(function(){
		 charCount($(this));
	 }).blur(function(){
		 charCount($(this));
	 }).change(function(){
		 charCount($(this));
	 }).keyup(function(){
		 charCount($(this));
	 });
	 

	 try{
		 $('input.date').datepicker({
			 	showMonthAfterYear: true, 
				prevText: '이전달',
				nextText: '다음달',
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				dayNamesMin:["일","월","화","수","목","금","토"],
				dateFormat:"yy-mm-dd",
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true,
/*				showOn: "button",
				buttonImage: "images/calendar.gif",
				buttonImageOnly: true,	*/			
				currentText: '오늘 날짜' ,
				closeText: '닫기'

		});
	 }catch(e){}
	 
	 
	 try{
	 $('input.dateImg').datepicker({
		 	showMonthAfterYear: true,
			prevText: '이전달',
			nextText: '다음달',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:["일","월","화","수","목","금","토"],
			dateFormat:"yy-mm-dd",
			changeMonth: true,
			changeYear: true,
			showButtonPanel: true,
			showOn: "both",
			buttonImage: "/images/ico/ico_wh23_calendar_g.png",
			buttonImageOnly: true,			
			currentText: '오늘 날짜' ,
			closeText: '닫기'

	});
	}catch(e){}
	
	
	try{
		$('input.datetime').appendDtpicker({
			"autodateOnStart": false,
			"locale": "foo",
			minDate : new Date(),
			"externalLocale": {
				foo: {
					days: ["일","월","화","수","목","금","토"],
					months: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					sep: '.',
					format: 'YYYY.MM.DD hh:mm',
					prevMonth: 'Foo',
					nextMonth: 'Bar',
					today: 'Foobar',
					closeButton:true
				}
			}
		});
		
	}catch(e){}
	
	 
	 
	 $.ajaxSetup({
		 beforeSend : function() {
			$("#ajax_load_indicator").show();
		 },
		 complete : function() {
		 	$("#ajax_load_indicator").hide();
		 },
		 error: function(xhr, status, error){
			alert("데이터 통신 도중 오류가 발생하였습니다.\n새로고침 후에 다시 실행해주세요.");
		 }
		  
	});
		
	 
});


/**
 * 글자수 실시간 체크
 * 
 * <p><input type="text"  charCount="true"  maxlength="30" /><span class="charCount" >0</span> / 30</p>
 * 
 */
function charCount(el){
	 var charCount = el.val().length;
	 try{
		 el.parent().find(".charCount").text(charCount);
	 }catch(e){}
}

// 글자수 체크
function getByteLength(input) {
    var byteLength = 0;
    for(var inx = 0; inx < input.value.length; inx++) {
        var oneChar = escape(input.value.charAt(inx));
        if ( oneChar.length == 1 ) {
            byteLength ++;
        } else if (oneChar.indexOf("%u") != -1) {
            byteLength += 2;
        } else if (oneChar.indexOf("%") != -1) {
            byteLength += oneChar.length/3;
        }
    }
    return byteLength;
}


function isNUM(){
	var key = event.keyCode;
	if(!(key==8 || key==9 || key==13 || key==46 || key==144 || (key>=48 && key<=57) || key==110 || key==190)){
		alert('숫자만 입력가능합니다');
		event.returnValue=false;
		try{ event.target.value = ""; }catch(e){}
	}
}

function hanNum(obj) {
	var pattern = /[^(a-zA-Z)]/; //영문만 허용
	if (!pattern.test(obj.value)) {
		//alert("한글만 허용합니다.");
		obj.value = '';
		obj.focus();
		return false;
	}
}

function han(obj) {
	var pattern = /[^(ㄱ-힣)]/; //한글만 허용 할때
	if (pattern.test(obj.value)) {
		//alert("한글만 허용합니다.");
		obj.value = '';
		obj.focus();
		return false;
	}
}
function eng(obj) {
	var pattern = /[^(a-zA-Z)]/; //영문만 허용
	if (pattern.test(obj.value)) {
		alert("영문만 허용합니다.");
		obj.value = '';
		obj.focus();
		return false;
	}
}
function all(obj) {
	var pattern = /[^(ㄱ-힣a-zA-Z0-9)]/; //한글,영문,숫자만 허용
	if (pattern.test(document.getElementById('name').value)) {
		alert("한글,영문,숫자만 허용합니다.");
		obj.value = '';
		obj.focus();
		return false;
	}
}

/* 한글입력 방지 */
function fn_press_han(obj)
{
    //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
    || event.keyCode == 46 ) return;
    //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
}

/**
 * 
 * ---> 
 */





/**
 * 값 유효성 체크
 */
function trimNvl(str){
	var tmp;
		
	try{
		tmp = str.replace(/(^[\s\xA0]+|[\s\xA0]+$)/g, '');
	}catch(e){
		tmp = str;
	}

	if ( tmp == "" ) {
		return true;
	}else{
		return false;
	}

}

/**
 * 콤마찍기
 */
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}


/**
 * 오늘 날짜 
 */
function curDate() {
	var today = new Date();
	var day;
	var mon;
	if (today.getDate()<10)
		day = '0' + today.getDate();
	else 
		day = today.getDate();
	
	mon = today.getMonth()+1;
	if ( mon <10)
		mon = '0' + mon;	
	
	
	return today.getFullYear() + '-' + (mon) + '-' + day;

}

/**
 * 날짜 더하기
 */
function addDate(month, days) {
	var today = new Date();
	var day = today.getDate();
	var mon;
	var addmonth=1;
	var addday=0;
	
	day+=days;
	var result = new Date(today.getFullYear() , (today.getMonth()+month) , day);
	
	if (result.getDate()<10)
		day = '0' + result.getDate();
	else 
		day = result.getDate();
	
	mon = result.getMonth()+addmonth;
	if ( mon <10)
		mon = '0' + mon;
	return result.getFullYear() + '-' + (mon) + '-' + day;
}


//이메일 체크
function email_chk(mail){
	
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	
	if ( !regExp.test( mail ) ) {	      
	      return false
	}else{
		return true
	}

}

//전화 번호 체크
function phone_chk(mail){
	var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	
	if ( !regExp.test( mail ) ) {	      
	      return false
	}else{
		return true
	}

}



function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString() ) + "; path=/";
    document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    		}
    return unescape(cookieValue);
}

/** 
 * 우편번호 찾기 페이징
 * **/
function getScriptPagingStrForPost(START_PAGE, END_PAGE, CURR_PAGE, PAGE_GROUP_SIZE, TOT_PAGE_CNT, IMG_URL, list) {
	
	pagingStr = '';
	pagingStr = pagingStr + '<div class="pager">';
	//pagingStr = pagingStr + '<a class="arrow" href="javascript:void(0);" onclick="goList(\'1\');"><img alt="처음페이지" src="' + IMG_URL + '/images/admin/comment/icon_board_first.gif" /></a>&nbsp;';
	if (END_PAGE > 0) {
		if (START_PAGE > PAGE_GROUP_SIZE) {
			pagingStr = pagingStr + '<a href="#" onclick="goList(\'' + (START_PAGE + PAGE_GROUP_SIZE) + '\',' + list + ');"><img src="/images/common/btn_prev.gif" alt="이전페이지" /></a>&nbsp;';
		}
	}
	for (var i=START_PAGE; i<=END_PAGE; i++) {
		if (i == CURR_PAGE) {
			pagingStr = pagingStr + '<a href="#" class=\"on\" onclick="goList(\'' + i + '\',' + list + ');">' + i + '</a>&nbsp;';
		} else {
			pagingStr = pagingStr + '<a href="#" onclick="goList(\'' + i + '\',' + list + ');">' + i + '</a>&nbsp;';
		}
	}
	if (END_PAGE < TOT_PAGE_CNT) {
			pagingStr = pagingStr + '<a href="#" onclick="goList(\'' + (START_PAGE + PAGE_GROUP_SIZE) + '\',' + list + ');"><img src="/images/common/btn_next.gif" alt="다음페이지" /></a>&nbsp;';
	}
	pagingStr = pagingStr + '</div>';
	//pagingStr = pagingStr + '<a class="arrow" href="javascript:void(0);" onclick="goList(\'' + TOT_PAGE_CNT + '\');"><img alt="마지막페이지" src="' + IMG_URL + '/images/admin/comment/icon_board_last.gif" /></a>';

	return pagingStr;
}

function replaceAll(StringData,oldString , newString){
	return StringData.split(oldString ).join(newString);
}


//jstl data 형태를 json str 로 만듬
function dataJsonStr(data){
	return replaceAll(replaceAll(replaceAll(replaceAll(replaceAll(data, "=", "\":\""  ) , ", ", "\",\""  ) , "}" , "\"}" ), "{" , "{\"")  , "null" , "" );	
}

// jstl data 형태를 json object로 만듬
function dataJsonObject(data){
	return JSON.parse( dataJsonStr(data));
}



function clearForm(str) {
	
	$("#"+str).find('input').each(function(){
		
		$(this).val("");
		
		if ( $(this).attr('type') == "checkbox" ){ // 체크박스	
			 $(this).attr('checked' , false);
		}		
	});
	
	 
	 // select 초기화
	$("#"+str).find('select').each(function(){
		
		$(this).find('option').each(function(index){						 	
			if ( index == 0){
				//$(this).attr("selected", "selected");
				$(this).prop("selected","selected");
			}else{
				//$(this).attr("selected", false);
				$(this).prop("selected",false);
			}
		});
		$('.selectbox').click();
	});
	


}

/**
 * 특수문자 디코딩
 * @param str
 * @returns
 */
function htmlEntityDec(str){
    if(str == "" || str == null){
        return str;
    }
    else{
        return str.replace(/&amp;/gi, "&").replace(/&#35;/gi, "#").replace(/&lt;/gi, "<").replace(/&gt;/gi, ">").replace(/&quot;/gi, "'").replace(/&#39;/gi, '\\').replace(/&#37;/gi, '%').replace(/&#40;/gi, '(').replace(/&#41;/gi, ')').replace(/&#43;/gi, '+').replace(/&#47;/gi, '/').replace(/&#46;/gi, '.').replace(/&#59;/g, ";");
    }
}

/**
 * undefinded 공백 처리
 * @param data
 * @returns {Boolean}
 */
function empty(data)
{
  var str
  if(typeof(data) == 'undefined' || data === null)
  {
	  str = "";
  }else{
	  str = data;
  }
  return str
}

//업로드 파일 체크
function fileExtCheck(file)
{
	// 첨부 파일 이미지 체크
	if (file.toLowerCase().match(/.(jsp|php|asp|html|perl|exe|bat|sh)$/i)) {  // 이부분의 확장자를 변경하시면 됩니다.
		alert("해당파일은 업로드 할 수 없습니다.");
		return false;
	}else{
		return true;
	}
	

	
}

//파일 용량체크
function fileSizeCheck(file){
	var maxSize = 10485760;	
	try{
		var size  = document.getElementById(file).files[0].size;
		if(size > maxSize){
			alert("파일 용량이 10MB 를 초과하였습니다.");
			return false;
		}else{
			return true;
		}
	}catch(e){
		return true;
	}
	
	
}


//파일 용량체크
function fileSizeCheck_10mb(file){
	var maxSize = 10485760;	
	try{
		var size  = document.getElementById(file).files[0].size;
		if(size > maxSize){
			alert("파일 용량이 10MB 를 초과하였습니다.");
			return false;
		}else{
			return true;
		}
	}catch(e){
		return true;
	}
	
	
}



//모바일인가?
function isMobile(){
	var returnStr = false;
	if(navigator.userAgent.match(/Android|Mobile|iP(hone|od|ad)|BlackBerry|IEMobile|Kindle|NetFront|Silk-Accelerated|(hpw|web)OS|Fennec|Minimo|Opera M(obi|ini)|Blazer|Dolfin|Dolphin|Skyfire|Zune/)){
		returnStr = true;
	}

	return returnStr;
}


/**
 * 안드로이드인가?
 */
function checkAndroidDevice() {
    var mobileKeyWords = new Array( 'Android');
    for (var info in mobileKeyWords) {
        if (navigator.userAgent.match(mobileKeyWords[info]) != null) {
            return true;

        }
    }
    return false;
}





/**
 * 비밀번호 체크
 */
function passwordChk(pw){
	var returnStr = true;
	var patt_4num1 = pw.search(/(\w)\1\1\1/); // 같은 영문자&숫자 연속 4번 정규식
	var patt_4num2 = pw.search(/([\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"])\1\1\1/); // 같은 특수문자 연속 4번 정규식
	var patt_4num3 = pw.search(/([가-힣ㄱ-ㅎㅏ-ㅣ\x20])\1\1\1/); // 같은 한글 연속 4번 정규식
	var patt_cont = pw.search(/(0123)|(1234)|(2345)|(3456)|(4567)|(5678)|(6789)|(7890)/); // 연속된 숫자 정규식
	
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var han = pw.search(/([가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	
	if(returnStr && pw.search(/₩s/) != -1){
		alert("비밀번호는 공백없이 입력해주세요.");		
		returnStr = false;
	}

	
	if(returnStr && ( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0))   ||  ( pw.length < 4  )   ||  ( pw.length > 8  ) ){
		alert("4~8자리의 영문,숫자,특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
		returnStr = false;
	}
	
	
	/*
	if(returnStr != "" &&  ( (num < 0 && eng < 0 && han < 0 ) || (eng < 0 && spe < 0  && han < 0 ) || (spe < 0 && han < 0 && num < 0)   ||  (eng < 0 && num < 0 && spe < 0)   )    ||  ( pw.length < 8  )   ||  ( pw.length > 20  )  ){
		alert("8-20 자리의 한글,영문,숫자,특수문자 중 2가지 이상을 혼합하여 입력해주세요.");		
		returnStr = false;
	}
	*/
	
	
	if(returnStr && patt_4num1 > -1 ){
		alert('같은 영문자&숫자열을 연속 4번 쓸수 없습니다.');
		returnStr = false;
	}
	
	if(returnStr && patt_4num2 > -1 ){
		alert('같은 특수문자열을 연속 4번 쓸수 없습니다.');
		returnStr = false;
	}
	
	if(returnStr && patt_4num3 > -1 ){
		alert('같은 한글을 연속 4번 쓸수 없습니다.');
		returnStr = false;
	}
	
	if(returnStr && patt_cont > -1 ){
		alert('4자리 연속된 숫자는 쓸수 없습니다.');
		returnStr = false;
	}
	
	return returnStr;
}

