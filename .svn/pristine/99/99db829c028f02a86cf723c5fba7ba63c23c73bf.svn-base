<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="robots" content="noindex, nofollow">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link rel="Shortcut Icon" href="../../images/favicon.ico">

  <title>매입 상세</title>
</head>

<body>  <!--seciton-->
  <div class="list-section">
    <table class="detail-talbe">
      <tr>
        <th>아이디</th>
        <td colspan="3"><c:out value="${detail.MEMBER_MAIL_ADDR }" /></td>
        <th>매입 일시</th>
        <td colspan="3"><c:out value="${detail.CREATION_DATE }" /></td>
      </tr>
      <tr>
        <th>은행</th>
        <td colspan="3"><c:out value="${detail.BANK_NAME }" /></td>
        <th>계좌번호</th>
        <td colspan="3"><c:out value="${detail.ACNT_NUMBER }" /></td>
      </tr>
      <tr>
        <th>총 매수</th>
        <td colspan="3"><c:out value="${detail.reqTotalRow }" /></td>
        <th>총 금액</th>
        <td colspan="3"><fmt:formatNumber value="${detail.reqTotalMoney }" pattern="#,###" /></td>
      </tr>
      <tr>
        <th>성공매수</th>
        <td><c:out value="${detail.reqSuccRow }" /></td>
        <th>실패매수</th>
        <td><c:out value="${detail.reqFailRow }" /></td>
        <th>성공금액</th>
        <td><fmt:formatNumber value="${detail.reqSuccMoney }" pattern="#,###" /></td>
        <th>실패금액</th>
        <td><fmt:formatNumber value="${detail.reqFailMoney }" pattern="#,###" /></td>
      </tr>
    </table>
    
    <div class="detail-list">
      <ul>
        <li>핀번호</li>
        <li>금액</li>
        <li>성공여부</li>
        <li>실패이유</li>
      </ul>
      
      <c:forEach items="${detailList}" var="list" varStatus="status">
	      <ul>
	        <li><c:out value="${list.FIN_NUMBER}" /></li>
	        <li><fmt:formatNumber value="${list.REQ_MONEY }" pattern="#,###" /></li>
	        <li><input type="checkbox" <c:if test="${list.SUCCESS_YN eq 'Y' }">checked</c:if> ><span class="icon-chk"></span></li>
	        <li>
	        	<c:choose>
	        		<c:when test="${list.SUCCESS_YN eq 'Y' }">-</c:when>
	        		<c:otherwise><c:out value="${list.FAIL_REASON}" /></c:otherwise>
	        	</c:choose>
	        </li>
	      </ul>
      </c:forEach>
      
    </div>
  </div>
</body>

</html>