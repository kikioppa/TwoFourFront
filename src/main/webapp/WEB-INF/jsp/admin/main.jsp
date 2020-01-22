<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ["날짜", "인원"],
    <c:forEach items="${statList}" var="list" varStatus="status">
        ["<c:out value="${list.JOINDATE}" />", <c:out value="${list.JOINCNT}" />]
        <c:if test="${!index.last }">, </c:if>
        
    </c:forEach>
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1]);

  var options = {
    title: "회원가입통계",
    width: 562,
    height: 208,
    bar: {groupWidth: "50%"},
    legend: { position: "none" },
  };
  var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
  chart.draw(view, options);
}

function go_view(seq) {
 		$("#seq").val(seq);
 		$("#frm").attr("action" , '/admin/board/inquiry/write.do');
 		$("#frm").submit();
 	}
 	
 	function go_putView(gubun, seq){
 		if(gubun == 'Y'){
 			$("#frm").attr("action" , '/admin/purchase/largeDetail.do');	
 		}else{
 			$("#frm").attr("action" , '/admin/purchase/detail.do');	
 		}
 		$("#seq").val(seq);
 		$("#frm").submit();
 	}
  </script>

</head>
<body>
<!--section-->
 <form id="frm" name="frm" method="post">
 	<input type="hidden" id="seq" name="seq" value="" />
  <div class="section ">
    <div class="newPurchase ">
      <h5>최신 매입처리내역</h5>
      <div class="purchase-list ">
        <ul class="list-name ">
          <li class="date ">날짜</li>
          <li class="applicant ">신청자</li>
          <li class="purchase-time ">매입시간</li>
          <li class="purchase-amount ">매입금액</li>
        </ul>
        
    	<c:forEach items="${purList }" var="list" varStatus="status">
	        <ul>
	          <li class="date "><c:out value="${list.buyDate}" /></li>
	          <li class="applicant" style="cursor: pointer;" onclick="go_putView('<c:out value="${list.LARGE_YN}" />','<c:out value="${list.SEQ}" />')" >
	          	<c:out value="${list.MEMBER_NAME}" />
	          </li>
	          <li class="purchase-time "><c:out value="${list.buytime}" /></li>
	          <li class="purchase-amount "><fmt:formatNumber value="${list.reqSuccMoney }" pattern="#,###" /></li>
	        </ul>
    	</c:forEach>
      </div>
      <p><a href="/admin/purchase/list.do">+ 더보기</a></p>
    </div>
    <!---->
    <div class="section-right ">
      
      
      <div class="qa ">
      
        <h5>1:1 문의 리스트 현황</h5>
      
        <div>
          <ul>
            <li class="date ">날짜</li>
            <li class="title ">문의제목</li>
            <li class="answer ">상태</li>
          </ul>
          <c:forEach items="${listHelper.list}" var="list" end="4" varStatus="status">
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
        </div>
        <p><a href="/admin/board/inquiry/list.do">+ 더보기</a></p>
     
      <c:if test="${empty listHelper.list}">
						<tr><td colspan="6">데이터가 없습니다.</td></tr>
					</c:if>
      </div>
      
      <div class="join-statistics ">
        <h5>회원 가입통계</h5>
        <div id="columnchart_values"></div>
        <p><a href="# ">+ 더보기</a></p>
      </div>
    </div>
  </div>
  </form>
</body>

</html>
