<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>문화 1번가 - FAQ</title>
  <script>
    function check(e) {
      var dama = e.childNodes[0]
      if (dama.src.match("faq-down")) {
        dama.src = "${web_server_url}/images/front/faq-up.png";
      } else {
        dama.src = "${web_server_url}/images/front/faq-down.png";
      }
    }
    
    function go_paging(page){
    	$("#frm").attr("action" , "list.do");
    	$("#categorySeq").val($(".on > input").val());
    	$("#curPage").val(page);
    	$("#frm").submit();
    }	
    
    function cate_change(seq){
    	$("#frm").attr("action" , "list.do");
    	$("#categorySeq").val(seq);
    	$("#frm").submit();
    }
    
    function search(){	
    	$("#frm").attr("action" , "list.do");
    	$("#categorySeq").val($(".on > input").val());
		$("#searchYn").val("Y");
		$("#frm").submit();
    }
  </script>
</head>

<body>
  <!--section-->
  <div class="section">
    <div class="section-main service-list faq">
      <h2>FAQ</h2>
      <div>
        <ul class="search-type">	          
        <c:forEach items="${categoryList}" var="list" varStatus="status">
				<c:choose>
					<c:when test="${listHelper.list[0].CATE_SEQ == list.SEQ}">
	          			<li class="list1 on">
					</c:when>
					<c:otherwise>
	          			<li class="list1">
					</c:otherwise>
				</c:choose>
		          <a href="javascript:cate_change(<c:out value='${list.SEQ}'/>)"><c:out value="${list.CATE_NAME}"/></a>
		          <input type="hidden" value="<c:out value='${list.SEQ}'/>">
		        </li>
	     </c:forEach>
        </ul>
		<form action="" name="frm" id="frm">
			<input type="hidden" name="categorySeq" id="categorySeq" value="">
			<input type="hidden" id="curPage" name="curPage" value="" />
			<input type="hidden" id="searchYn" name="searchYn" value="">
	        <div class="search-box">
	          <select name="searchCondition" id="searchCondition">
		        <c:choose>
				    <c:when test="${param.searchCondition eq 'content'}">
					    <option value="title">제목</option>
					    <option value="content" selected="true">내용</option>
				    </c:when>
				    <c:otherwise>
					    <option value="title" selected="true">제목</option>
					    <option value="content">내용</option>
				    </c:otherwise>
				</c:choose>
			  </select>
	          <div class="select_arrow"><img src="${web_server_url}/images/front/select_arrow.png" alt=""></div>
	          <div class="search">
	            <input type="text" name="searchKeyword" id="searchKeyword" value="<c:out value='${param.searchKeyword}'/>">
	            <button onclick="search()"><img src="${web_server_url}/images/front/search.png" alt="돋보기 이미지"></button>
	          </div>
	        </div>
		</form>
      </div>
      <ul class="list list1-con">	      
      <c:forEach items="${listHelper.list}" var="list" varStatus="status">
        <li>
          <ul class="qus">
            <li class="number">Q.</li>
            <li class="class"><c:out value="${list.CATE_NAME}"/></li>
            <li class="title" onclick="check(this)"><a href="#"><c:out value="${list.INQUIRY_CONTENTS}" escapeXml="false"/></a></li>
            <li class="butt"><img src="${web_server_url}/images/front/faq-down.png" alt="화살표 이미지"></li>
          </ul>
          <ul class="aco">
            <li class="number">A.</li>
            <li class="contents"><c:out value="${list.ANSWER_CONTENTS}" escapeXml="false"/></li>
          </ul>
        </li>
	     </c:forEach>
      <div class="pageSection ">
		<ndn:paging listHelper="${listHelper}"/>
	  </div>
      <!-- 
      <div class="paging">
        <div>
          <p class="fiste">
            <a href="#"><img src="${web_server_url}/images/front/first.png" alt="페이징 화살표 이미지"></a>
          </p>
          <p class="prev">
            <a href="#"><img src="${web_server_url}/images/front/prev2.png" alt="페이징 화살표 이미지"></a>
          </p>
        </div>
        <div class="page-number">
          <ul>
            <li class="num1 on"><a href="#">1</a></li>
            <li class="num2"><a href="#">2</a></li>
            <li class="num3"><a href="#">3</a></li>
            <li class="num4"><a href="#">4</a></li>
            <li class="num5"><a href="#">5</a></li>
          </ul>
        </div>
        <div>
          <p class="next">
            <a href="#"><img src="${web_server_url}/images/front/next2.png" alt="페이징 화살표 이미지"></a>
          </p>
          <p class="last">
            <a href="#"><img src="${web_server_url}/images/front/last.png" alt="페이징 화살표 이미지"></a>
          </p>
        </div>
      </div> 
      -->
    </div>
  </div>
</body>

</html>