<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<html>
<head>
<title>AR 가이드 장소</title>
<script>



$(document).ready(function() {
	$("#allChk").click(function() {
	    if($(this).is(':checked')) {
			$("input[name='seqArray']").prop("checked", true);
	    } else {
	    	$("input[name='seqArray']").prop("checked", false);
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

//삭제
function fn_del(){
	$("#seq").val('');
	
	if( checkedValid() && confirm("삭제하시겠습니까?")){
		
		$.ajax({
			type : "post",			
			url : "../place/del_proc.json",
			dataType : 'json',
			data: $('form#frm').serialize() ,
			
			success : function(data) {
				$('#ajax_load_indicator').hide();			
				
				if ( data.success){
					alert("정상적으로 삭제하였습니다.");
					window.location.reload();
				}else{
					alert(data.message);
				}
			
			}
		});
		
	}
}


function go_view(seq, rownum) {
	$("#frm").attr("action" , "write.do");
	$("#seq").val(seq);
	$("#rownum").val(rownum);
	$("#frm").submit();
}	

function go_write() {
	$("#frm").attr("action" , "write.do");
	$("#seq").val('');
	$("#frm").submit();
}	

function go_search(){
	
	$("#curPage").val("1");
	$("#frm").attr("action", "");
	$("#frm").submit();
}	

function go_paging(page){
	$("#curPage").val(page);
	$("#frm").submit();
}


</script>
</head>
<body>

	<div class="contWarp">
		<div class="contents noTab">
			<!-- contents  -->
			<form method="post" action="" name="frm" id="frm">
			<input type="hidden" id="curPage"  name="curPage" value="<c:out value="${param.curPage}"   default="1"  escapeXml="false" />" />
			<input type="hidden" id="seq"  name="seq" value="" />
			<input type="hidden" id="rownum"  name="rownum" value="" />
			
			<table class="tableSt_01">
				<colgroup>
					<col style="width:50px;" />
					<col style="width:100px;" />				
					<col style="width:100px;" />
					<col />
					<col style="width:100px;" />
					<col style="width:150px;" />
					
					
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox"  id="allChk"  /></th>
						<th>번호</th>
						<th>대표이미지</th>
						<th>장소명</th>						
						<th>지형지물</th>					
						<th>카테고리</th>						
						<th>등록일</th>
						
					</tr>
				</thead>
				<tbody>
								
					<c:forEach items="${listHelper.list}" var="list" varStatus="status">						
						<tr class="mainNotice">
							<td><input type="checkbox" name="seqArray" id="chk${status.count }"  value="<c:out value="${list.seq }"/>" /></td>
							<td><c:out value="${list.rownum}"/></td>
							<td>
								<div style="max-width:80px;padding: 5px;">
									<c:if test="${not empty list.file_stre_cours }" >
										<img src="<c:out value="${ndn:getImgUrl(list.file_stre_cours , list.stre_file_nm ) }"/>"   alt="<c:out value="${list.orignl_file_nm}"/>"  style="width: 100%;height: 100%;"/>
									</c:if>	
								</div>
							</td>
							<td class="left">
								<a href="javascript:go_view('<c:out value="${list.seq }"/>', '<c:out value="${ (listHelper.totalCount - list.rownum) +1 }"/>') ;">
									<c:out value="${list.title}"/>
								</a>						
							</td>
							<td>
								<c:if test="${list.geographic eq 'Y' }">Y</c:if>
							</td>
							<td>
								<c:choose>
									<c:when test="${list.category eq 'I' }">Info</c:when>
									<c:when test="${list.category eq 'E' }">먹고</c:when>
									<c:when test="${list.category eq 'P' }">놀고</c:when>
									<c:when test="${list.category eq 'S' }">자고</c:when>
								</c:choose>
							</td>
							<td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"  /></td>
						</tr>
					</c:forEach>
					
					<c:if test="${empty listHelper.list}">
						<tr>
							<td colspan="6">
								<div class="resultNothing">
									<p>게시물이 없습니다.</p>									
								</div>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div class="pageSection">

				<ndn:paging listHelper="${listHelper}"/>

				<div class="btnSec ">
					<button type="button" onclick="fn_del();" class="btn type_02 leftBtn">삭제</button>
					<button type="button" onclick="go_write();" class="btn type_01 rightBtn">등록</button>
				</div>	
						
			</div>			
			<div class="searchSection">
				<select name="searchCondition" id="searchCondition">
					<option value="title" <c:if test="${param.searchCondition eq 'title'}">selected</c:if>>제목</option>
					
				</select>
				<input type="text" name="searchKeyword" id="searchKeyword" value="<c:out value="${param.searchKeyword}"/>">
				<button type="button" onclick="go_search();"  class="btn">검색</button>
			</div>
			
			<!-- //contents  -->
			</form>
		</div>
	</div>
	
</body>