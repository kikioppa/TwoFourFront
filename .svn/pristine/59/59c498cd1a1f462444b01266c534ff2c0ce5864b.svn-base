<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="robots" content="noindex, nofollow">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title>매입 리스트</title>
  <script type="text/javascript">
  	function go_paging(page){
		$("#frm").attr("action" , "list.do");
		$("#curPage").val(page);
		$("#frm").submit();
	}
  	
  	function go_search(){
		$("#frm").attr("action" , "list.do");
		$("#frm").submit();
	}
  	
  	function go_view(seq){
		$("#seq").val(seq);
		$("#frm").attr("action" , "detail.do");
		$("#frm").submit();
	}
  	
  	
  </script>
</head>

<body>
 
  <!--section-->
  <form name="frm" id="frm" method="post">
  	<input type="hidden" name="curPage" id="curPage" value="" />
  	<input type="hidden" name="seq" id="seq" value="" />
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
	      <li>매입날자</li>
	      <li>아이디</li>
	      <li>이름</li>
	      <li>총금액</li>
	      <li>총매수</li>
	      <li>매입시간</li>
	      <li>성공금액</li>
	      <li>실패금액</li>
	      <li>성공매수</li>
	      <li>실패매수</li>
	    </ul>
	    <c:forEach items="${listHelper.list}" var="list" varStatus="status">
		    <ul class="table-list-ul">
		      <li><a href="javascript:void(0);"><c:out value="${list.buyDate}" /></a></li>
		      <li><a href="javascript:go_view('<c:out value="${list.SEQ}" />')"><c:out value="${list.MEMBER_MAIL_ADDR}" /></a></li>
		      <li><c:out value="${list.MEMBER_NAME}" /></li>
		      <li><fmt:formatNumber value="${list.reqTotalMoney }" pattern="#,###" /></li>
		      <li><c:out value="${list.reqTotalRow}" /></li>
		      <li><c:out value="${list.buytime}" /></li>
		      <li><fmt:formatNumber value="${list.reqSuccMoney }" pattern="#,###" /></li>
		      <li><fmt:formatNumber value="${list.reqFailMoney }" pattern="#,###" /></li>
		      <li><c:out value="${list.reqSuccRow}" /></li>
		      <li><c:out value="${list.reqFailRow}" /></li>
		    </ul>
	    </c:forEach>
	    
	    
	    <div class="pageSection">
	      <ndn:paging listHelper="${listHelper}"/>
	    </div>
	  </div>
 </form>

</body>

</html>