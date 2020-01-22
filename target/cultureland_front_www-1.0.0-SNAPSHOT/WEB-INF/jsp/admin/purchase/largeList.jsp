<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>대용량 리스트</title>
   <script type="text/javascript">
  	function go_paging(page){
		$("#frm").attr("action" , "largeList.do");
		$("#curPage").val(page);
		$("#frm").submit();
	}
  	
  	function go_search(){
		$("#frm").attr("action" , "largeList.do");
		$("#frm").submit();
	}
  	
  	function go_view(seq){
		$("#seq").val(seq);
		$("#frm").attr("action" , "largeDetail.do");
		$("#frm").submit();
	}
  	
  	
  </script>
  
</head>

<body>  
<form name="frm" id="frm" method="post">
	<input type="hidden" name="curPage" id="curPage" value="" />
  	<input type="hidden" name="seq" id="seq" value="" />
  	
<!--section-->
  <div class="list-section">
     <div class="purchase-list-header">
	       <input type="date" name="startDate" id="startDate" value="<c:out value="${param.startDate }" />">~
	       <input type="date" name="endDate" id="endDate" value="<c:out value="${param.endDate }" />">
	       
	      <select name="searchCondition" id="searchCondition">
	        <option value="total" <c:if test="${empty param.searchCondition || searchCondition eq 'total' }">selected</c:if> >전체</option>
	        <option value="memberId" <c:if test="${param.searchCondition eq 'memberId' }">selected</c:if>>아이디</option>
	        <option value="memberName" <c:if test="${param.searchCondition eq 'memberName' }">selected</c:if>>이름</option>
	      </select>
	      
	      <input type="text" name="searchKeyword" id="searchKeyword" placeholder="전체" value="<c:out value="${param.searchKeyword }" />">
	      <button type="button" class="find-btn" onclick="go_search();">검색</button>
	    </div>
  </div>
  <div class="info-table-list">
    <ul class="table-list-ul">
      <li>매입 신청 날짜</li>
      <li>아이디</li>
      <li>이름</li>
      <li class="amount">총금액</li>
      <li>총매수</li>
      <li>접수여부</li>
      <li>입금여부</li>
    </ul>
    
    <c:forEach items="${listHelper.list}" var="list" varStatus="status">
	    <ul class="table-list-ul">
	      <li><fmt:formatDate value="${list.CREATION_DATE}" pattern="yyyy.MM.dd"/></li>
	      <li><a href="javascript:go_view('<c:out value="${list.SEQ }" />');"><c:out value="${list.MEMBER_MAIL_ADDR }" /></a></li>
	      <li><c:out value="${list.MEMBER_NAME }" /></li>
	      <li class="amount"><fmt:formatNumber value="${list.reqTotalMoney }" pattern="#,###" /></li>
	      <li><c:out value="${list.reqTotalRow }" /></li>
	      <li><input type="checkbox" <c:if test="${list.ACCEPT_YN eq 'Y' }">checked</c:if> ><span class="icon-chk"></span></li>
	      <li>
	      	<c:choose>
	      		<c:when test="${list.DEPOSIT_YN eq 'Y' }">입금</c:when>
	      		<c:otherwise>미입금</c:otherwise>
	      	</c:choose>
	      </li>
	    </ul>
    </c:forEach>
    
    <div class="pageSection">
      <ndn:paging listHelper="${listHelper}"/>
    </div>
  </div>
</form>

</body>

</html>