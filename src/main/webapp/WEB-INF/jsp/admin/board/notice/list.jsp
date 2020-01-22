<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>관리자 페이지-공지사항</title>
<script>
function go_view(seq) {
	$("#frm").attr("action" , "write.do");
	$("#seq").val(seq);
	$("#frm").submit();
}	
function go_paging(page){
	$("#frm").attr("action" , "list.do");
	$("#curPage").val(page);
	$("#frm").submit();
}	
function search(){
	$("#searchYn").val("Y");
}
</script>
</head>

<body>
	<div class="section">
		<h2>공지사항</h2>
		<div class="breadcrumbs">
			<a href="#" class="home"><span>home</span></a> <span>게시판관리</span> <span>공지사항</span>
		</div>
		<div class="section-main">
			<div class="section-in">
				<div class="option-box">
					<form action="" method="post" name="frm" id="frm">
						<input type="hidden" id="seq" name="seq" value="">
						<input type="hidden" id="searchYn" name="searchYn" value="">
						<input type="hidden" id="curPage" name="curPage" value="" />
						<ul class="option">
							<li class="answer">
						        <c:choose>
								    <c:when test="${param.topYn eq 'Y'}">
								    	<input class="check" type="checkbox" name="topYn" value="Y" checked="checked"> 상단 고정 여부
								    </c:when>
								    <c:otherwise>
								        <input class="check" type="checkbox" name="topYn" value="Y"> 상단 고정 여부
								    </c:otherwise>
								</c:choose>
							</li>
							<li class="date">
								날짜지정 <input class="text" type="date" name="startDate" id="startDate" value="<c:out value='${param.startDate}'/>"> ~ 
								<input class="text" type="date" name="endDate" id="endDate" value="<c:out value='${param.endDate}'/>">
							</li>
							<li class="select">
								<select name="searchCondition" id="searchCondition">
						        <c:choose>
								    <c:when test="${param.searchCondition eq 'adminName'}">
										<option value="title">제목</option>
										<option value="adminName" selected="true">작성자</option>
								    </c:when>
								    <c:otherwise>
										<option value="title" selected="true">제목</option>
										<option value="adminName">작성자</option>
								    </c:otherwise>
								</c:choose>
								</select>
							</li>
							<li class="title"><input type="text" name="searchKeyword" id="searchKeyword" value="<c:out value='${param.searchKeyword}'/>"></li>
						</ul>
						<button onclick="search()">검색</button>
					</form>
				</div>
					<table>
						<tr class="color">
							<td>글번호</td>
							<td class="title">제목</td>
							<td>작성자</td>
							<td>게시일</td>
						</tr>
						<c:forEach items="${listHelper.list}" var="list" varStatus="status">
							<tr>
								<td><a href="javascript:go_view('<c:out value="${list.seq}"/>');"><c:out value="${list.rownum}"/></a></td>
								<td class="title">
									<a href="javascript:go_view('<c:out value="${list.seq}"/>');">
										<c:out value="${list.title}"/>
										<c:if test="${!empty list.STRE_FILE_NM}">
											<img alt="파일 아이콘" src="${web_server_url}/images/ico/ico_file.png">
										</c:if>
									</a>
								</td>
								<td><c:out value="${list.creation_user}" /></td>
								<td><fmt:formatDate value="${list.creation_date}" pattern="yyyy-MM-dd a hh:mm"/></td>
							</tr>
						</c:forEach>
					</table>
				<div class="pageSection ">
					<ndn:paging listHelper="${listHelper}"/>
				</div>
				<div class="writing">
					<a href="/admin/board/notice/write.do">글쓰기</a>
				</div>
			</div>
		</div>
	</body>
</html>