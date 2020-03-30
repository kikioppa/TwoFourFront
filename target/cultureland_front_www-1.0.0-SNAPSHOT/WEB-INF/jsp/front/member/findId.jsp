<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
  <title>로그인</title>
  <script src="https://auth.logintalk.io/js/logintalk.js"></script>
  <script type="text/javascript">

	function fn_findIde(){
	  if(isValid() && confirm('찾으시겠습니까?')){
		  $("#memberPhone").val($("#memberPhone").val().replace(/-/gi,''));
		  console.log($("#memberPhone").val());
			var option = {
				type : "post",
				url: './user_findId.json',
				data: $("#frm").serialize() ,
				dataType: 'json',
				beforeSend: function() {
					$('#ajax_load_indicator').show();
				},
				success : function(data) {
					if (data.result == 'success'){
						fn_findId();
					<!--alert('성공하였습니다.');-->
						<!--return fn_test();-->
					<!--	window.location.reload(); -->
					}else if(data.result == 'idError'){
						alert('없는 번호입니다.');
						return ;
					}
				},
				error: function(request, status, err) {
					//alert('서버와의 통신이 실패했습니다.');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+err);
				},
				complete : function() {
					$('#ajax_load_indicator').hide();
				}
			};
			$("#frm").ajaxSubmit(option);
		}
	}
	  
  	function isValid(){
		var returnStr = true;
	  	var phone = $("#memberPhone").val();
		var getPhone = RegExp(/^\d{3}\d{3,4}\d{4}$/); 
	  
		if(  returnStr  &&  trimNvl( $("#memberPhone").val() )){
			alert('전화번호를 입력해 주십시요.');
			$('#memberPhone').focus();
			returnStr = false;
		
	  		}
		return returnStr;
  	}
  	
	function fn_findId() {

		var options = {
			key : "stMyAHwTh",
			service : 4,
			auto : false,
			verify:true,
			user : $("#memberPhone").val(),
			action : "./founid.do"

		};
		logintalk(options);
		

		function cb(token) {
			console.log("token : " + token);
			$("#token").val(token);
			$("#frm").attr('action', './foundid.do');
			$("#frm").submit();
		}
		logintalk.callback(cb);
	}
 	</script>
  

</head>

<body>
<div class="section">
	<div class="wrapper">
	<h1 class="login-header">로그인</h1>
		<div class="id-find">
			<div class="tab tab-large">
				<ul class="tab-btns">
		            <li class="findging-id on"><a href="/member/findId.do">아이디 찾기</a></li>
		            <li class="findging-pw"><a href="/member/findPw.do">비밀번호찾기</a></li>
				</ul>
	        </div>
	        <div class="id-text">
				<p>회원가입시 인증받은 휴대폰 번호를 입력해주세요.</p>
				<p>회원가입시 본인인증에 사용한 "로그인톡"으로 메시지가 전달됩니다.</p>
	        </div>
			<div class="id-form">
				<form name="frm" id="frm" method="post">
					<input type="tel" placeholder="휴대폰 번호“-”제외한 번호입력" name="memberPhone" id="memberPhone" class="phone-number-check">
					<input type="hidden" name="token" id="token" value="" />
					<button type="button" class="red-btn" onclick="fn_findIde()">아이디 찾기</button>
				</form>
			</div>
		</div>
	</div>
</div>
      </div>
      </div>
</body>
