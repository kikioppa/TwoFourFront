<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="robots" content="noindex, nofollow">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

 <title>고객상세정보</title>
 <script src="http://malsup.github.com/jquery.form.js"></script> 
 <script>
 
 function mailSend(mailYn){
	 if(mailYn == 'Y'){
		 alert('수신동의 회원');
		 
	 
	 }else{
		 alert('수신동의하지 않은 회원입니다.');
	 }
 }

 function go_update(update){

	 var result = confirm("회원상태를 변경하시겠습니까?");
	 if(result == true){
		 alert("계속 진행합니다");
		 }
	 
	 else {
		 alert("취소 합니다");
	return;	 
	 }

	 
	 if(update == 'A'){
		 console.log('정상');
		 $("#memberStat").val("B");
	 }else{
		 console.log('블랙');
		 $("#memberStat").val("A");
	 }
	 
	 var option = {
			type : "post",
			url: './updateStat.json',
			data: $("#frm").serialize() ,
			dataType: 'json',
			beforeSend: function() {
				$('#ajax_load_indicator').show();
			},
			success : function(data) {
				if(data.success){
					alert('성공하였습니다.');
					window.location.reload();
				}else{
					alert('실패 하였습니다.');
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
 
 
 function resetPassword(resetPassword){
	 
	 var result = confirm("비밀번호를 초기화 하시겠습니까?");
	 if(result == true){
		 alert("계속 진행합니다");
		 }
	 
	 else {
		 alert("취소 합니다");
	return;	 
	 }
	 
	 $("#resetPassword").val(resetPassword);
	 
	 var option = {
			type : "post",
			url: './resetPassword.json',
			data: $("#frm").serialize() ,
			dataType: 'json',
			beforeSend: function() {
				$('#ajax_load_indicator').show();
			},
			success : function(data) {
				if(data.success){
					alert('성공하였습니다.');
					window.location.reload();
				}else{
					alert('실패 하였습니다.');
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
 
 

 function go_view(seq) {
		$("#inqSeq").val(seq);
		$("#inqFrm").attr("action" ,'/admin/board/inquiry/write.do');
		$("#inqFrm").submit();
	}

 </script>
</head>

<body>
  <!--section-->
  <form id="inqFrm" name="inqFrm" method="post">
	  <input type="hidden" id="inqSeq" name="seq" value="" />
  </form>
  <form id="frm" name="frm" method="post">
  <input type="hidden" id="seq" name="seq" value="" />
  
  <div class="info-section">
      <table class="info_tb">
      <tr>
        <th>아이디</th>
        <td><c:out value="${detail.MEMBER_MAIL_ADDR}"/></td>
        <th>이름</th>
        <td><c:out value="${detail.MEMBER_NAME}"/></td>
        
      </tr>
      <tr>
        <th>전화번호</th>
        <td><c:out value="${detail.MEMBER_PHONE}"/></td>
        <th>회원상태</th>
        <td>
        	<c:choose>
	        	<c:when  test="${detail.MEMBER_STAT eq 'A' }"> 정상 </c:when>
	        	<c:when  test="${detail.MEMBER_STAT eq 'B' }"> 블랙리스트</c:when>
        	</c:choose>
        	<input type="hidden" id="memberStat"  name="memberStat" value="<c:out value="${detail.MEMBER_STAT}"/>" />
        	<input type="hidden" id="memberNO"  name="memberNO" value="<c:out value="${detail.MEMBER_NO}"/>" />
        	<button type="button" class="info-btn" onclick="go_update('<c:out value="${detail.MEMBER_STAT}"/>')"> 회원상태변경</button>
        </td>    
      </tr>
      <tr>
        <th>은행</th>
        <td><c:out value="${detail.BANK_NAME}"/></td>
        <th>이메일 수신동의</th>
        <td><c:choose>
        	<c:when  test="${detail.MAIL_YN eq 'Y' }">수신동의</c:when>
        	<c:when  test="${detail.MAIL_YN eq 'N' }">수신거부</c:when>
        	</c:choose></td>
      </tr>
      <tr>
        <th>계좌번호</th>
        <td colspan="3"><c:out value="${detail.ACNT_NUMBER}"/></td>
      </tr>
    </table>
    <div class="consent">
      <div class="sms-consent">
      
      
        <div class="consent-btn">
        <button type ="button" onclick="resetPassword('<c:out value="${detail.MEMBER_PASSWORD}"/>')">비밀번호 재발급</button>
        </div>
      </div>
      <!-- 
      <div class="email-consent">
      	<div class="consent-btn">
      	<button type="button" onclick="mailSend('<c:out value="${detail.MAIL_YN}"/>')">이메일 보내기</button>
      	</div>
      </div>  -->
      
      <div class="email-consent">
   
   <!--    <div class="consent-text">회원상태 설정</div>
        <div class="consent-radiobox">
        	<input type="radio" name="memberStat" value="usual" id="usual"<c:if test="${detail.MEMBER_STAT eq 'A' }">checked</c:if> >정상
        	<input type="radio" name="memberStat" value="blackList" id="blackList"<c:if test="${detail.MEMBER_STAT eq 'B' }">checked</c:if> >블랙리스트
        -->   
        <div class="consent-btn">
      
        </div>
      </div>
    </div>
    
  </div>
  
  <div class="info-list">
    <div class="list-amount">
      <ul class="list-header">
        <li class="date">날짜</li>
        <li>매입요청</li>
        <li>매입 금액</li>
      </ul>
      
      <c:forEach items="${purList}" var="list" end="2" varStatus="status">
         <ul>
           <li class="date "><c:out value="${list.buyDate }" /></li>
         	<li class="title"><c:out value="${list.buytime }" /></li>
           <li class="answer "><fmt:formatNumber value="${list.reqSuccMoney }" pattern="#,###" /></li>
         </ul>
  	  </c:forEach>
		  
	  <c:if test="${empty purList}">
	  	 <ul>
           <li class="date "></li>
         	<li class="title">매입요청이 없습니다.</li>
           <li class="answer "></li>
         </ul>
	  </c:if>
		
		<p><a href="/admin/board/inquiry/list.do">+ 더보기</a></p>
            
     </div>

 	
    	
    </div>
      
      
    
    <div class="state-list">
      <ul class="list-header">
       <li class="date ">날짜</li>
            <li class="title ">문의제목</li>
            <li class="answer ">상태</li>
          </ul>
          <c:forEach items="${listHelper.list}" var="list" end="2" varStatus="status">
	          <ul>
	            <li class="date "><fmt:formatDate value="${list.creation_date }" pattern="yyyy-MM-dd"/></li>
	          <li class="title"><a href="javascript:go_view('<c:out value="${list.seq}"/>');"><c:out value="${list.title}"/></a></li>
	            <li class="answer ">
		            <c:choose>
			        	<c:when  test="${list.inq_yn eq 'Y' }"> 답변완료 </c:when>
			        	<c:otherwise > 답변대기</c:otherwise>
		        	</c:choose>
        		</li>
	          </ul>
		  </c:forEach>
		  <c:if test="${empty listHelper.list}">
			<tr><td colspan="3">데이터가 없습니다.</td></tr>
		  </c:if>
		
		<p><a href="/admin/board/inquiry/list.do">+ 더보기</a></p>
            
        </div>

 	
    	
    </div>

 </form>

</body>

</html>