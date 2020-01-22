 <%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="/WEB-INF/tld/ndn.tld" prefix="ndn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>로그인</title>
<link rel="stylesheet" href="${web_server_url}/css/admin.css" />
<link rel="stylesheet" href="${web_server_url}/css/admin_reset.css" />
<link rel="stylesheet" href="${web_server_url}/css/admin_common.css" />
<link rel="stylesheet" href="${web_server_url}/css/admin.css" />
<script type="text/javascript" src="${web_server_url}/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${web_server_url}/js/jquery.form.js"></script>
<script type="text/javascript" src="${web_server_url}/js/core.min.js"></script>
<script type="text/javascript" src="${web_server_url}/js/sha256.min.js"></script>
<script type="text/javascript" src="${web_server_url}/js/admin.js"></script>
<script type="text/javascript" src="${web_server_url}/js/utils.js"></script>

<script>
$(function(){

	$("#pw").on('keypress', function(e) {
		if (e.which == 13) {/* 13 == enter key@ascii */
			goLogin();
		}
	});
	
});

function goLogin(){
	if ( isValid() ){
		$("#pw").val(CryptoJS.SHA256(pwEncode($('#id').val().trim(), $('#pw').val().trim())).toString());		
		$("#adminUserVO").submit();
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
<div class="warp loginWarp">
	<div class="login">
<!-- 		<p><img src="/images/common/spc_logo_adm.png"></p> -->
		<%-- <li><spring:message code="select.default"/></li> --%>
		<form:form commandName="adminUserVO" modelAttribute="adminUserVO" name="frm" method="post" class="loginForm"  action="${web_ssl_url}/admin/loginAction.do" >
		<div class="loginFrom">
			<div>
				<p><label for="userId" >아이디</label> <form:input path="id" value="cultureland"/><form:errors path="id" cssClass="error"/></p>
				<p><label for="userPw">비밀번호</label> <form:password path="pw" value="1234" /><form:errors path="pw" cssClass="error"/></p>
			</div>
			<button type="button" onclick="goLogin()">로그인</button>
			<span class="notice" style="display: none">아이디 또는 비밀번호가 틀렸습니다.</span>
			
			<form:errors path="success" cssClass="error"/>
			
		</div>
		</form:form>
	</div>
</div>


<div class="footerWarp">
	<div class="footer">

		<div class="copySection">
			
			<ul>
				<li>COPYRIGHT© 2019 JEONJUK SMARTTOUR ALL RIGHTS RESERVED.</li>
			</ul>
		</div>
	</div>
</div>


</body>
</html>
