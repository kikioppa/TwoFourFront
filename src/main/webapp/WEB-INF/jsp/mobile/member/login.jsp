<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    

<head>
	<title>로그인</title>

	<script>
		$(function(){
			$("#pw").on('keypress', function(e) {
				if (e.which == 13) {/* 13 == enter key@ascii */
					goLogin();
				}
			});
		});
		var getUrlParameter = function getUrlParameter(sParam) {
		    var sPageURL = window.location.search.substring(1),
		        sURLVariables = sPageURL.split('&'),
		        sParameterName,
		        i;

		    for (i = 0; i < sURLVariables.length; i++) {
		        sParameterName = sURLVariables[i].split('=');

		        if (sParameterName[0] === sParam) {
		            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
		        }
		    
		    }
		};
		
function goLogin(){
	if ( isValid() ){
		
		
		var option = {
				type : "post",
				url: './loginAction.do',
				data: $("#userVO").serialize() ,
				dataType: 'json',
				beforeSend: function() {
					$('#ajax_load_indicator').show();
				},
				success : function(data) {
					if(data.result == 'success'){
						alert('로그인 되었습니다.');
						if(getUrlParameter('url') !== undefined && getUrlParameter('url') != ""){
							window.location.href = getUrlParameter('url');
						}else{
							window.location.href = '/index.do';
						}
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
					$('#ajax_load_indicator').hide();
				}
			};
		
			
			$("#userVO").ajaxSubmit(option);
			
	}
}


function isValid(){
	var returnStr = true;
	
	if(  returnStr  &&  trimNvl( $("#id").val() )){
		alert('아이디를 입력해 주십시요');
		$('#id').focus();
		returnStr = false;
	}	
	
	
	if(  returnStr  &&  trimNvl( $("#pw").val() )){
		alert('비밀번호를 입력해 주십시요');
		$('#pw').focus();
		returnStr = false;
	}	
	
	return returnStr;	
}



</script>
</head>
<body>

	<div class="container login">

		<section class="input-form">
		<form:form commandName="userVO" modelAttribute="userVO" name="frm" method="post" class="loginForm"  action="${web_ssl_url}/member/loginAction.do" >
			<div class="input-text-wrap underline-type prefix-icon">
				<span class="icon-id"></span>
				<input type="text" name="id" id="id" maxlength="50" placeholder="아이디" value="">
			</div>
			<div class="input-text-wrap underline-type prefix-icon">
				<span class="icon-password"></span>
				<input type="password" name="pw" id="pw" maxlength="15" placeholder="비밀번호">
			</div>
			<div class="input-text-wrap login-status">
				<span class="checkbox-label">
					<label>
						<span class="checkbox-wrap">
							<input type="checkbox">
							<span class="icon"></span>
						</span>로그인상태 유지
					</label>
					</span>
			</div>

			<div class="btn-wrap">
				<a href="javascript:goLogin()" class="btn primary lg square">로그인</a>
			</div>
			<div class="links">
				<ul>
					<li><a href="${web_ssl_url}/m/member/findId.do">아이디 찾기</a></li>
					<li><a href="${web_ssl_url}/m/member/findPw.do">비밀번호 찾기</a></li>
					<li><a href="${web_ssl_url}/m/member/join.do"><em>회원가입</em></a></li>
				</ul>
			</div>
		</form:form>
		</section>    

	</div>

</body>
