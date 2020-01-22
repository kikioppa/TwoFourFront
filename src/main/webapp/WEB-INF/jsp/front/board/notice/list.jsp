<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function go_view(noticeId, rownum) {
	$("#frm").attr("action" , "detail.do");
	$("#noticeId").val(noticeId);
	$("#rownum").val(rownum);
	$("#frm").submit();
}
function go_paging(page){
	$("#frm").attr("action" , "list.do");
	$("#curPage").val(page);
	$("#frm").submit();
}	
function search(){
	$("#frm").attr("action" , "list.do");
	$("#searchYn").val("Y");
	$("#frm").submit();
}
</script>
</head>
<body>
<div class="section">
    <div class="section-main notice-pg service-list">
      <h2>공지사항</h2>
      <div>
        <ul class="search-type">
          <li class="list1 on"><a href="#">전체</a></li>
          <li class="list2"><a href="#">서비스</a></li>
          <li class="list3"><a href="#">점검</a></li>
          <li class="list4"><a href="#">뉴스</a></li>
          <li class="list5"><a href="#">기타</a></li>
        </ul>
	  <form action="" name="frm" id="frm" method="post">
	  	<input type="hidden" name="noticeId" id="noticeId" value="">
	  	<input type="hidden" name="rownum" id="rownum" value="">
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
      <ul class="list-title">
        <li class="number">NO</li>
        <li class="class">분류</li>
        <li class="title">제목</li>
        <li class="date">작성일</li>
      </ul>
      <div class="list list1-con">
		<c:forEach items="${listHelper.list}" var="list" varStatus="status">
			<c:choose>
				<c:when test="${list.notice_yn eq 'Y'}">
		        	<ul class="urgent">
		          	  <li class="number">공지</li>
				</c:when>
				<c:otherwise>
		        	<ul>
		          	  <li class="number"><c:out value="${list.rownum}"/></li>
				</c:otherwise>
			</c:choose>
	          <li class="class">서비스</li>
	          <li class="title"><a href="javascript:go_view(<c:out value='${list.seq}'/>, <c:out value='${list.rownum}'/>)"><c:out value="${list.title}"/></a></li>
	          <li class="date"><fmt:formatDate value="${list.creation_date}" pattern="yyyy-MM-dd"/></li>
	        </ul>
		</c:forEach>
		<div class="pageSection ">
			<ndn:paging listHelper="${listHelper}"/>
		</div>
    </div>
  </div>
</body>
</html>