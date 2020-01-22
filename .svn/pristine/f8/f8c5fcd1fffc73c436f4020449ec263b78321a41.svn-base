<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>관리자 페이지-1:1문의</title>
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
</script>
</head>

<body>
	<div class="section">
		<h2>1:1문의</h2>
		<div class="breadcrumbs">
			<a href="#" class="home"><span>home</span></a> <span>게시판관리</span> <span>1:1문의</span>
		</div>
		<div class="section-main">
			<div class="section-in">
				<div class="option-box">
					<form action="" method="post" name="frm" id="frm">
						<input type="hidden" id="seq" name="seq" value="">
						<input type="hidden" id="searchYn" name="searchYn" value="Y">
						<input type="hidden" id="curPage" name="curPage" value="" />
						<ul class="option">
							<li class="answer">
						        <c:choose>
								    <c:when test="${param.answerYn eq 'Y'}">
								    	<input class="check" type="checkbox" name="answerYn" value="Y" checked="checked"> 답변 여부
								    </c:when>
								    <c:otherwise>
								        <input class="check" type="checkbox" name="answerYn" value="Y"> 답변 여부
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
								    <c:when test="${param.searchCondition eq 'memberName'}">
										<option value="title">제목</option>
										<option value="memberName" selected="true">문의자</option>
								    </c:when>
								    <c:otherwise>
										<option value="title" selected="true">제목</option>
										<option value="memberName">문의자</option>
								    </c:otherwise>
								</c:choose>
								</select>
							</li>
							<li class="title"><input type="text" name="searchKeyword" id="searchKeyword" value="<c:out value='${param.searchKeyword}'/>"></li>
						</ul>
						<button>검색</button>
					</form>
				</div>
					<table>
						<tr class="color">
							<td>문의번호</td>
							<td class="title">제목</td>
							<td>문의자</td>
							<td>문의날짜</td>
							<td>답변여부</td>
						</tr>
						<c:forEach items="${listHelper.list}" var="list" varStatus="status">
							<tr>
								<td><a href="javascript:go_view('<c:out value="${list.seq}"/>');"><c:out value="${list.rownum}"/></a></td>
								<td class="title"><a href="javascript:go_view('<c:out value="${list.seq}"/>');"><c:out value="${list.title}"/></a></td>
								<td><c:out value="${list.creation_user}" /></td>
								<td><fmt:formatDate value="${list.creation_date}" pattern="yyyy-MM-dd a hh:mm"/></td>
								<td><c:out value="${list.inq_yn}" /></td>
							</tr>
						</c:forEach>
					</table>
				<div class="pageSection ">
					<ndn:paging listHelper="${listHelper}"/>
				</div>
			</div>
		</div>
	</body>
</html>