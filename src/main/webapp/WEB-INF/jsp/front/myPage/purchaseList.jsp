<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>매입신청내역 상세</title>
  
  <script type="text/javascript">
	function go_view(seq) {
		$("#frm").attr("action" , "purchaseDetail.do");
		$("#seq").val(seq);
		$("#frm").submit();
	}
	function go_paging(page){
		$("#frm").attr("action" , "purchaseList.do");
		$("#curPage").val(page);
		$("#frm").submit();
	}
	
	function search(){
		$("#frm").attr("action" , "purchaseList.do");
		$("#frm").submit();
	}
	
	/* 날짜 객체 받아서 문자열로 리턴하는 함수 */
	function getDateStr(myDate){
	    var year = myDate.getFullYear();            
	    var month = (1 + myDate.getMonth());        
	    month = month >= 10 ? month : '0' + month; 
	    var day = myDate.getDate();                   
	    day = day >= 10 ? day : '0' + day;          
	    return  year + '-' + month + '-' + day;
	}

	/* 오늘 날짜를 문자열로 반환 */
	function today() {
	  var d = new Date()
	  return getDateStr(d)
	}

	/* 오늘로부터 1주일전 날짜 반환 */
	function lastWeek() {
	  var d = new Date()
	  var dayOfMonth = d.getDate()
	  d.setDate(dayOfMonth - 7)
	  return getDateStr(d)
	}

	/* 오늘로부터 3개월전 날짜 반환 */
	function threeMonth() {
	  var d = new Date()
	  var monthOfYear = d.getMonth()
	  d.setMonth(monthOfYear - 3)
	  return getDateStr(d)
	}

	/* 오늘로부터 6개월전 날짜 반환 */
	function sixMonth() {
	  var d = new Date()
	  var monthOfYear = d.getMonth()
	  d.setMonth(monthOfYear - 6)
	  return getDateStr(d)
	}

	function pick(date) {
		  $("#endDate").val(today())
		if( date == "today"){
		    $("#startDate").val(today())
		  }else if(date == "week") {
		  	$("#startDate").val(lastWeek())
		  }else if(date == "threeMonth") {
		  	$("#startDate").val(threeMonth())
		  }else if(date == "sixMonth") {
		  	$("#startDate").val(sixMonth())
		  }
		  search();
	}
	</script>
</head>

<body>
 
  <div class="section">
    <div class="wrapper">
      <div class="buy-header">
        <h1>매입신청내역</h1>
      </div>
      <div class="date-join">
	  	<form action="" name="frm" id="frm" method="post">
			<input type="hidden" id="seq" name="seq" value="" />
			<input type="hidden" id="curPage" name="curPage" value="" />
		        <ul>
		          <li>기간조회</li>
		          <li><button type="button" onclick="pick('today')"> 당일</button></li>
		          <li><button type="button" onclick="pick('week')"> 1주일</button></li>
		          <li><button type="button" onclick="pick('threeMonth')"> 3개월</button></li>
		          <li><button type="button" onclick="pick('sixMonth')"> 6개월</button></li>
		          <li>날짜지정</li>
		        </ul>
		        <span class="date-sele">
		        	<input type="date" name="startDate" id="startDate" value="<c:out value="${param.startDate }" />">-
		        	<input type="date" name="endDate" id="endDate" value="<c:out value="${param.endDate }" />"> 
		        	<input type="button" onclick="search()" value="조회">
        		</span>
	  	</form>
      </div>
      <table class="buy-list">
        <colgroup>

        </colgroup>

        <tr class="thead">
          <th>주문번호</th>
          <th>신청 핀코드 수</th>
          <th>신청 핀코드액면가</th>
          <th>매입금액</th>
          <th>입금일자</th>
          <th>상태</th>
        </tr>        
        <c:forEach items="${listHelper.list}" var="list" varStatus="status">
	        <tr>
	          <th><a href="javascript:go_view(<c:out value='${list.SEQ}'/>)"><c:out value="${list.rownum}"/></a></th>
	          <th><c:out value="${list.finCount}"/></th>
	          <th><c:out value="${list.moneySum}"/></th>
	          <th><c:out value="${list.realSum}"/></th>
	          <th><c:out value="${list.date}"/></th>
	          <th><c:out value="${list.state}"/></th>
	        </tr>
		</c:forEach>
		
		<c:if test="${empty listHelper.list}">
	        <tr>
	          <th colspan="6">매입신청 내역이 없습니다.</th>
	        </tr>
	        <tr>
	          <th colspan="6"></th>
	        </tr>
		</c:if>

      </table>
      
	<div class="paging">
		<ndn:paging listHelper="${listHelper}"/>
	</div>
      <!-- 
      <div class="paging">
        <div>
          <p class="fiste"><img src="../img/first.png" alt="처음으로"></p>
          <p class="prev"><img src="../img/prev2.png" alt="뒤로가기"></p>
        </div>
        <div class="page-number">
          <ul>
            <li class="on"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
          </ul>
        </div>
        <div>
          <p class="next"><img src="../img/next2.png" alt="다음으로"></p>
          <p class="last"><img src="../img/last.png" alt="끝으로"></p>
        </div>
      </div> 
      -->
    </div>
  </div>
</body>

</html>