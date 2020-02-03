<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>문화 1번가 - 1:1문의</title>
<!--   <link rel="stylesheet" href="../../css/style.css"> -->
<!--   <link rel="stylesheet" href="../../css/sub.css"> -->
<!--   <script src="../../js/jquery-1.12.4.min.js"></script> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!--   <script src="../../js/list.js"></script> -->
<!--   <script src="../../js/gnb.js"></script> -->
  <script>
	function go_write(){
		$("#frm").attr("action" , "/board/inquiry/write.do");
		$("#frm").submit();
	}
	function go_paging(page){
		$("#frm").attr("action" , "question.do");
		$("#curPage").val(page);
		$("#frm").submit();
	}
    function check(e) {
      var dama = e.childNodes[0]
      if (dama.src.match("faq-down")) {
        dama.src = "../../img/faq-up.png";
      } else {
        dama.src = "../../img/faq-down.png";
      }
    }    
  </script>
</head>

<body>
  <!--section-->
  <div class="section">
    <div class="section-main service-list question-list">
      <h2>1:1 문의</h2>
      <div>
        <div class="question-btn-wrap">
          <button class="question-btn" onclick="go_write()">1:1 문의하기</button>
        </div>
      </div>
      <ul class="list list1-con">
        <li class="th">
          <ul>
            <li class="divide">번호</li>
            <li class="title">문의내용</li>
            <li class="date">작성일</li>
            <li class="state">답변</li>
          </ul>
        </li>
        <c:forEach items="${listHelper.list}" var="list" varStatus="status">
	        <li>
	          <ul class="qus">
	            <li class="class"><a href="#"><c:out value="${list.rownum}"/></li>
	            <li class="title" onclick="check(this)"><a href="#"><c:out value="${list.title}"/></a></li>
	            <li class="date"><c:out value="${list.creation_date}"/></li>
		        <c:choose>
				    <c:when test="${list.inq_yn eq 'Y'}">
	            		<li class="state">답변완료</li>
				    </c:when>
				    <c:otherwise>
           				<li class="state waiting">답변대기</li>
				    </c:otherwise>
				</c:choose>
	          </ul>
	          <ul class="aco">
	            <p>
	              <c:if test="${empty list.contents}">아직 답변되지 않은 문의입니다.</c:if>
	              <span class="write-date"><c:out value="${list.answerDate}"/></span>
	              <c:out value="${list.contents}"/>
	            </p>
	          </ul>
	        </li>
        </c:forEach>
	  <div class="paging">
	  	<ndn:paging listHelper="${listHelper}"/>
	  </div>
    </div>
  </div>
  <form action="" id="frm" name="frm" method="post">
  	<input type="hidden" id="curPage" name="curPage" value="" />
  </form>
</body>

</html>