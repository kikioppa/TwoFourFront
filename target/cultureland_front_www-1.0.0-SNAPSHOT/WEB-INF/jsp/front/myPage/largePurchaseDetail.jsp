<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<head>
  <title>대용량 매입신청내역 상세</title>
  <script type="text/javascript">
  	function go_list(){
		$("#frm").attr("action" , "largePurchaseList.do");
		$("#frm").submit();
	}
	function go_paging(page){
		$("#frm").attr("action" , "largePurchaseDetail.do");
		$("#curPage").val(page);
		$("#frm").submit();
	}
  </script>
</head>

<body>
  <div class="section">
    <div class="wrapper">
      <div class="buy-header">
        <h1>대용량 매입신청 상세내역</h1>
      </div>
      <table class="buy-list">
        <colgroup>
          <col style="width: auto;">
          <col style="width: auto;">
          <col style="width: auto;">
          <col style="width: auto;">
        </colgroup>

        <tr class="thead">
          <th>핀번호</th>
          <th>금액</th>
          <th>성공여부</th>
          <th>실패이유</th>
        </tr>     
        <c:forEach items="${listHelper.list}" var="list" varStatus="status">
	        <tr>
	          <th><c:out value="${list.FIN_NUMBER}"/></th>
	          <th><c:out value="${list.REQ_MONEY}"/></th>
		      <c:choose>
			  	<c:when test="${list.SUCCESS_YN eq 'Y'}">
	          		<th>성공</th>
				</c:when>
				<c:otherwise>
	          		<th class="red">실패</th>
				</c:otherwise>
			  </c:choose>
	          <th><c:out value="${list.FAIL_REASON}"/></th>
	        </tr>
		</c:forEach>
      </table>
	  <div class="paging">
		<ndn:paging listHelper="${listHelper}"/>
	  </div>
      <div class="bottom-btn-wrap">
        <button class="btn-line-lg" type="button" onclick="go_list()">목록</button>
      </div>
    </div>
  </div>
  <form action="" method="post" name="frm" id="frm">
	  <input type="hidden" id="seq" name="seq" value="<c:out value="${seq}"/>"/>
	  <input type="hidden" id="curPage" name="curPage" value=""/>      
  </form>
</body>