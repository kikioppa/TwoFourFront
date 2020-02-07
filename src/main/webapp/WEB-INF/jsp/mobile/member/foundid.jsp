<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>    
<head>
<title>아이디 찾기</title>
</head>
<body>

<div class="section">
    <div class="wrapper">
      <h1 class="login-header">로그인</h1>
      <div class="id-find">
        <div class="tab tab-large">
          <ul class="tab-btns">
            <li class="findging-id on"><a href="/m/member/findId.do">아이디 찾기</a></li>
            <li class="findging-pw"><a href="/m/member/findPw.do">비밀번호찾기</a></li>
          </ul>
        </div>
        <div class="id-text">
	  		<div class="result-id">
    			<c:out value="${findMap.MEMBER_MAIL_ADDR}"/>	
          </div>
        </div>
        <div class="id-form">
       	<a href="${web_server_url}/m/member/login.do">		
         <button type="button" class="red-btn" onclick="location.href="${web_server_url}/m/member/login.do">로그인 하기</button>  
      
        </div>
      </div>
      
	 
</body>
