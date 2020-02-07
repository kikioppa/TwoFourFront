<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    

<head>
  <title>로그인</title>

  <script>
$(function(){

	$("#pwd").on('keypress', function(e) {
		if (e.which == 13) {/* 13 == enter key@ascii */
			goLogin();
		}
	});
	
});

function goLogin(){
	if ( isValid() ){
		$("#pw").val(CryptoJS.SHA256(pwEncode($('#id').val().trim(), $('#pwd').val().trim())).toString());
		
		var option = {
				type : "post",
				url: './loginAction.do',
				data: $("#userVO").serialize() ,
				dataType: 'json',
				beforeSend: function() {
					$('#ajax_load_indicator').show();
				},
				success : function(data) {
					console.log(data);
					if(data.result == 'success'){
						alert('로그인 되었습니다.');
						window.location.href = '/index.do';
					}else if(data.result == 'black'){
						alert('해당 계정은 블랙리스트 입니다.');
						return;
					}else{
						alert('아이디 또는 패스워드를 확인해 주세요.');
						return;
					}
				},
				error: function(request, status, err) {
					//alert('서버와의 통신이 실패했습니다.');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+err);
				},
				complete : function() {
					$("#id").val('');
					$("#pw").val('');
					$("#pwd").val('');
					$('#ajax_load_indicator').hide();
				}
			};
		
			
			
			$("#userVO").ajaxSubmit(option);
			
// 		$("#userVO").submit();
	}
}


function isValid(){
	var returnStr = true;
	
	if(  returnStr  &&  trimNvl( $("#id").val() )){
		alert('아이디를 입력해 주십시요');
		$('#id').focus();
		returnStr = false;
	}	
	
	
	if(  returnStr  &&  trimNvl( $("#pwd").val() )){
		alert('비밀번호를 입력해 주십시요');
		$('#pwd').focus();
		returnStr = false;
	}	
	
	return returnStr;	
}



</script>
</head>
<body>

  <div class="section login-page">
    <div class="wrapper">
      <h1 class="login-header">로그인</h1>
      <div class="login-form">
        <form:form commandName="userVO" modelAttribute="userVO" name="frm" method="post" class="loginForm"  action="${web_ssl_url}/front/member/loginAction.do" >
          <input type="hidden" name="pw" id="pw">
          <input type="text" placeholder="아이디" name="id" id="id">
          <input type="password" placeholder="비밀번호" name="pwd" id="pwd">
          <button type="button" class="red-btn" onclick="goLogin()">로그인</button>
        </form:form>
        <ul>
          <li><a href="${web_server_url}/front/member/findId.do">아이디 찾기</a></li>
          <li><a href="${web_server_url}/front/member/findPw.do">비밀번호찾기</a></li>
          <li><a href="${web_server_url}/front/member/join.do">회원가입</a></li>
        </ul>
      </div>
    </div>
  </div>
  
</body>
