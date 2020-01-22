<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>관리자 페이지-매입통계</title>
  
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["날짜", "금액"],
        <c:forEach items="${statList}" var="list" varStatus="status">
	        ["<c:out value="${list.purDate}" />", <c:out value="${list.purMoney}" />]
	        <c:if test="${!index.last }">, </c:if>
	        
        </c:forEach>
//         ["Element", "Density", { role: "style" } ],
//         ["Copper", 8.94, "#b87333"],
//         ["Silver", 10.49, "silver"],
//         ["Gold", 19.30, "gold"],
//         ["Platinum", 21.45, "color: #e5e4e2"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1]);

      var options = {
        title: "매입처리통계(단위:천원)",
        width: 1200,
        height: 500,
        bar: {groupWidth: "50%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
    
  function go_search(){
	  
	  if($("#month").val() != '' && $("#year").val() == ''){
		  alert('연도를 선택해 주세요.');
		  return;
	  }
	  
	  if($("#year").val() != '' && $("#month").val() == ''){
		  $("#gubun").val('M');
	  }else if($("#year").val() != '' && $("#month").val() != ''){
		  $("#gubun").val('D');
	  }
	  
	  $("#searchDate").val($("#year").val()+$("#month").val());
	  $("#frm").attr('action', './purchase.do');
	  $("#frm").submit();
	  
  }
  
  function fn_init(){
	  $("#year").val('');
	  $("#month").val('');
	  $("#gubun").val('');
  }
  </script>
  
</head>

<body>
<c:set var="today" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${today}" pattern="yyyy" var="start"/> 

  <div class="section">
    <h2>매입처리 통계</h2>
    <div class="breadcrumbs">
      <a href="#" class="home"><span>home</span></a>
      <span>통계관리</span>
      <span>매입처리 통계</span>
    </div>
    <div class="graph">
      <form name="frm" id="frm" method="post">
      	<input type="hidden" name="gubun" id="gubun" value="" />
      	<input type="hidden" name="searchDate" id="searchDate" value="" />
        <div>
         	 연도<select name="year" id="year" onChange="go_search()">
         	 	  <option value="">선택</option>
         	 	  <c:forEach begin="2020" end="${start}" var="idx" step="1">
           			  <option value="<c:out value="${idx}" />" <c:if test="${param.year eq idx }">selected</c:if> ><c:out value="${idx}" /></option>년
           		  </c:forEach>	
        	  </select>
        </div>
        <div>
          	월별<select name="month" id="month" onChange="go_search()">
          		  <option value="">선택</option>
          		  <c:forEach begin="1" end="12" var="idx" step="1">
          		  	  <fmt:formatNumber var="idxMon" minIntegerDigits="2" value="${idx}" type="number"/>
           			  <option value="<c:out value="${idxMon}" />" <c:if test="${param.month eq idxMon }">selected</c:if> ><c:out value="${idx}" /></option>월
           		  </c:forEach>	
          	</select>
        </div>
        
        <button type="button" onclick="go_search()" >조회</button>
        <button type="button" onclick="fn_init()" >검색초기화</button>
        
      </form>
      <div class="main-graph" id="columnchart_values">

      </div>
    </div>
  </div>
</body>

</html>