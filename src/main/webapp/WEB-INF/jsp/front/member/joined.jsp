<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>문화 1번가 - 회원가입</title>
  <script src="${web_server_url}/js/utils.js"></script>
  <script type="text/javascript" src="${web_server_url}/js/jquery.form.js"></script>
  <script type="text/javascript"> </script>
</head>

<body>
 <!--section-->
   <form name="frm" id="frm" action="post">
  	  	<input type="hidden" name="seq" id="seq" value="<c:out value='${detail.MEMBER_NO}' />" />
  	  <input type="hidden" name="memberId" id="memberId" value="" />
  	  
  <div class="section">
    <div class="section-main join_pg">
      <h2>회원가입</h2>
      <div class="matters-text">
        <div class="matters-img">
          <img src="../img/speaker.png" alt="확성기 이미지">
        </div>
 
      </div>
      <div class="join-form">
        <h3>가입완료</h3>
  	 </div>
    
      <div class="join-btn">
        <button type="button" onclick="fn_join()">회원가입</button>
      </div>
    </div>
  </div>
  </form>
</body>

</html>