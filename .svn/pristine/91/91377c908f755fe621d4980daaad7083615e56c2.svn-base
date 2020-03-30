<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>

<head>
  <title>매입신청 상세내역</title>
  <script type="text/javascript">
	  function go_list(){
			$("#frm").attr("action" , "purchaseList.do");
			$("#frm").submit();
		}
  </script>
</head>

<body>
  <div class="container buy-list">
    <section class="order-list-detail">
      <ul>     
        <c:forEach items="${listHelper.list}" var="list" varStatus="status">
	        <li class="item">
	          <ul>
	            <li>
	              <dl>
	                <dt>핀번호</dt>
	                <dd><c:out value="${list.FIN_NUMBER}"/></dd>
	              </dl>
	            </li>
	            <li>
	              <dl>
	                <dt>금액</dt>
	                <dd><c:out value="${list.REQ_MONEY}"/></dd>
	              </dl>
	            </li>
	            <li>
	              <dl>
	                <dt>성공여부</dt>
				      <c:choose>
					  	<c:when test="${list.SUCCESS_YN eq 'Y'}">
	                		<dd><span>성공</span></dd>
						</c:when>
						<c:otherwise>
	                		<dd><span class="primary">실패</span></dd>
						</c:otherwise>
					  </c:choose>
	              </dl>
	            </li>
	            <li>
	              <dl>
	                <dt>실패이유</dt>
	                <dd><c:if test="${list.SUCCESS_YN eq 'Y'}">-</c:if><c:out value="${list.FAIL_REASON}"/></dd>
	              </dl>
	            </li>
	          </ul>
	        </li>
		</c:forEach>
      </ul>
      <div class="btn-wrap">
        <a href="javascript:void(0)" class="btn minor lg square" onclick="go_list()">목록보기</a>
      </div>
  		<form action="" method="post" name="frm" id="frm"></form>
    </section>
  </div>
</body>