<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <script type="text/javascript">

	//리스트 페이지 이동
	function go_display() {
		$("#frm").attr("action" , "list.do");
		$("#frm").submit();
	}
	
	//글수정 페이지 이동
	function go_view(seq) {
		$("#frm").attr("action" , "write.do");
		$("#seq").val(seq);
		$("#frm").submit();
	}
	
  </script>
</head>

<body>
	<div class="section">
		<h2>전시관리</h2>
		<div class="breadcrumbs">
			<a href="#" class="home"><span>home</span></a> <span>전시관리</span>
		</div>
		<div class="section-main">
			<div class="section-in">
					<table>
						<tr class="color">
							<td>번호</td>
							<td>썸네일</td>
							<td>플랫폼</td>
							<td>사용유무</td>
							<td>노출순서</td>
							<td>링크</td>
							<td>등록일자</td>
						</tr>
						<c:forEach items="${bannerList}" var="list" varStatus="status">
							<tr onclick="go_view(<c:out value='${list.seq}'/>)">
 								<td><c:out value="${list.ROWNUM}"/></td>
								<td>
									<div style="max-width:80px;padding: 5px;">
										<c:if test="${not empty list.file_stre_cours }" >
											<img src="<c:out value="${ndn:getImgUrl(list.file_stre_cours , list.stre_file_nm ) }"/>"   alt="<c:out value="${list.orignl_file_nm}"/>"  style="width: 100%;height: 100%;"/>
										</c:if>	
									</div>
								</td>
						        <c:choose>
								    <c:when test="${list.PLAY_GUBUN eq 'P'}">
 										<td>PC</td>
								    </c:when>
								    <c:otherwise>
 										<td>Mobile</td>
								    </c:otherwise>
								</c:choose>
						        <c:choose>
								    <c:when test="${list.USE_YN eq 'Y'}">
 										<td>사용</td>
								    </c:when>
								    <c:otherwise>
 										<td>미사용</td>
								    </c:otherwise>
								</c:choose>
 								<td><c:out value="${list.ORDER_SORT}" /></td>
 								<td><c:out value="${list.LINK_URL}" /></td>
								<td><fmt:formatDate value="${list.creation_date}" pattern="yyyy-MM-dd a hh:mm"/></td> 
							</tr>
						</c:forEach>
					</table>
				<div class="pageSection"></div>
				<div class="pageSection"></div>
				<div class="writing">
					<a href="/admin/display/write.do">글쓰기</a>
				</div>
			</div>
		</div>
		<form action="" name="frm" id="frm" method="post">
			<input type="hidden" name="seq" id="seq">
		</form>
	</body>

</html>