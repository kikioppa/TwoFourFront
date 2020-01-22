<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/smarteditor/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
<title>게시판 관리</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#allChk").click(function() {
	    if($(this).is(':checked')) {
	      
	    	$(".ez-checkbox").addClass("ez-checked");
			$("input[name='seqArray']").prop("checked",true);
	    } else {
	     
	    	$(".ez-checkbox").removeClass("ez-checked");
			$("input[name='seqArray']").prop("checked",false);
	    }
	});	
	
});



//체크되어 있는지
function checkedValid(){
	var returnStr = true;
	
	var checkedCount =  $("input:checkbox[name=seqArray]:checked").length;
	if ( checkedCount == 0){
		alert('선택해주세요.');
		returnStr = false;
	}
	
	return returnStr;
}

function go_write(){
	$("#frm").attr("action", "write.do");
	$("#frm").submit();
}

function go_view(seq){
	$("#frm").attr("action", "view.do");
	$("#seq").val(seq);
	$("#frm").submit();
}

function go_search(){
	$("#frm").attr("action", "list.do");
	$("#frm").submit();
}

//체크되어 있는지
function checkedValid(){
	var returnStr = true;
	
	var checkedCount =  $("input:checkbox[name=seqArray]:checked").length;
	if ( checkedCount == 0){
		alert('삭제할 항목을 선택해주세요.');
		returnStr = false;
	}
	
	return returnStr;
}

//선택 글쓰기 전용
function checkedValid2(){
	var returnStr = true;
	
	var checkedCount =  $("input:checkbox[name=seqArray]:checked").length;
	if ( checkedCount == 0){
		alert('복사할 항목을 선택해주세요.');
		returnStr = false;
	}
	
	if ( checkedCount > 1){
		alert('1개의 항목만 선택해주세요.');
		returnStr = false;
	}
	
	return returnStr;
}

function go_copyWrite(){
	if(checkedValid2()){
		$("#frm").attr("action", "copyWrite.do");
		$("#frm").submit();
	}
}

function fn_delete(){
	if (checkedValid() && confirm("삭제하시겠습니까?")){
				
		var option = {
				type : "post",
				url: './del_proc.json',
				data: $("#frm").serialize() ,
				dataType: 'json',
				beforeSend: function() {
					$('#ajax_load_indicator').show();
				},
				success : function(data) {
					if(data.success){
						alert('삭제하였습니다.');
						window.location.reload();
					}else{
						alert('실패 하였습니다.');
					}
				},
				error: function(request, status, err) {
					//alert('서버와의 통신이 실패했습니다.');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+err);
				},
				complete : function() {
					$('#ajax_load_indicator').hide();
				}
			};
	
			$("#frm").ajaxSubmit(option);
	}
}

function go_paging(page){
	$("#curPage").val(page);
	$("#frm").submit();
}
</script>
</head>
<body>
<h1 style="font-weight: bold;font-size: 200%;">게시판 관리 - 공지사항</h1>

<div class="contWarp">
		<div class="contents noTab">
			<!-- contents  -->
			<form method="post" action="" name="frm" id="frm">
			<input type="hidden" id="curPage"  name="curPage" value="<c:out value="${param.curPage}"   default="1"  escapeXml="false" />" />
			<input type="hidden" id="seq"  name="seq" value="" />
			<input type="hidden" id="rownum"  name="rownum" value="" />
			<input type="hidden" id="gubun"  name="gubun" value="<c:out value="${gubun }"/>" />
			<table class="tableSt_01">
				<colgroup>
					<col style="width:50px;" />
					<col style="width:73px;" />
					<col style="width:100px;" />
					<col style="width:100%;" />
					<col style="width:100px;" />
					<col style="width:150px;" />
					<col style="width:70px;" />
					<col style="width:100px;" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox"  id="allChk"  /></th>
						<th>번호</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일시</th>
						<th>조회수</th>
						<th>노출</th>
					</tr>
				</thead>
				<tbody>
								
					<c:forEach items="${listHelper.list}" var="list" varStatus="status">
					
						<fmt:formatDate value="${now}" var="today" pattern="yyyyMMdd" />
						
						<tr class="mainNotice">
							<td><input type="checkbox" name="seqArray" id="chk${status.count }"  value="<c:out value="${list.seq }"/>" /></td>
							<td><c:out value="${list.rownum }"/> </td>
							<td><c:out value="${list.gubun_name }"/> </td>
							<td class="center">
								<a href="javascript:go_view('<c:out value="${list.seq }"/>') ;">
									<c:out value="${list.title }"/>
								</a>
							</td>
							<td><c:out value="${list.reg_user }"/></td>
							<td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd" /></td>
							<td><c:out value="${list.hit }"/></td>
							<td>
								<c:choose>
									<c:when test="${list.use_yn eq 'Y' }">노출</c:when>
									<c:otherwise>비노출</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${empty listHelper.list}">
						<tr><td colspan="8">데이터가 없습니다.</td></tr>
					</c:if>
				</tbody>
			</table>
			<div class="pageSection">

				<ndn:paging listHelper="${listHelper}"/>

				<div class="btnSec ">
					<button type="button" onclick="fn_delete();" class="btn type_02 leftBtn">삭제</button>
					<button type="button" onclick="go_write();" class="btn type_01 rightBtn">글쓰기</button>
				</div>	
						
			</div>			
			<div class="searchSection">
				<select name="searchCondition" id="searchCondition">
					<option value="title" <c:if test="${param.searchCondition eq 'title' || empty param.searchKeyword}">selected</c:if>>제목</option>
					<option value="content" <c:if test="${param.searchCondition eq 'content'}">selected</c:if>>내용</option>
				</select>
				<input type="text" name="searchKeyword" id="searchKeyword" value="<c:out value="${param.searchKeyword}"/>">
				<button type="button" onclick="go_search();"  class="btn">검색</button>
			</div>
			
			<!-- //contents  -->
			</form>
		</div>
	</div>
</body>
</html>