<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<head>
  <title>1:1문의</title>
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
      <ul class="mypage-tab">
        <li class="list1"><a href="${web_server_url}/myPage/purchaseList.do">매입신청내역</a></li>
<%--         <li class="list2"><a href="${web_server_url}/myPage/accountVerifi.do">계좌인증</a></li> --%>
        <li class="list3"><a href="${web_server_url}/myPage/limit.do">매입한도</a></li>
        <li class="list4 on"><a href="${web_server_url}/myPage/question.do">1:1문의</a></li>
        <li class="list5"><a href="${web_server_url}/myPage/myInfoCheck.do">개인정보수정</a></li>
      </ul>
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
	              <c:out value="${list.contents}" escapeXml="false"/>
	            </p>
	          </ul>
	        </li>
        </c:forEach>
        <c:if test="${empty listHelper.list}">
	        <li>
	          <ul style="text-align: center;">
	            <li>문의내역이 존재하지 않습니다.</li>
	          </ul>
	        </li>
	    </c:if>
    </div>
	  <div class="paging">
	  	<ndn:paging listHelper="${listHelper}"/>
	  </div>
  </div>
  <form action="" id="frm" name="frm" method="post">
  	<input type="hidden" id="curPage" name="curPage" value="" />
  </form>
</body>
