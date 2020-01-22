<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<html>
<head>
<title>AR 가이드 장소</title>
<script>

//리스트 페이지 이동
function go_list() {
	$("#frmParam").attr("action" , "list.do");
	$("#frmParam").submit();
	
}	

function go_view(){
	$("#frmParam").attr("action" , "view.do");
	$("#frmParam").submit();
}


function write_proc(){
	if ( isValid() && confirm("저장하시겠습니까?")){
			var option = {
					type : "post",
					url: "/admin/display/write_proc.json",
					data: $("#frm").serialize() ,
					dataType: 'json',
					success : function(data) {
						if(data.success){
							alert('성공하였습니다.');
							go_list();
						}else{
							alert('실패 하였습니다.');
						}
					},
					error: function(request, status, err) {
						//alert('서버와의 통신이 실패했습니다.');
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+err);
					}
				};
				$("#frm").ajaxSubmit(option);
	}
}


//전시관리 배너 삭제
function del_proc(){
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type : "post",			
			url : "/admin/display/del_proc.json",
			dataType : 'json',
			data: $("#frm").serialize() ,
			success : function(data) {
				if ( data.success){
					alert("정상적으로 삭제하였습니다.");
					go_list();
				}else{
					alert(data.message);
				}
			
			}
		});
	}
}


function isValid(){
	var returnStr = true;
	
	if(  returnStr  && $(':radio[name="use"]:checked').length < 1){
		alert('사용유무를 선택해 주십시요');
		$('#use').focus();
		returnStr = false;
	}	
	
	if(  returnStr  && $(':radio[name="platform"]:checked').length < 1){
		alert('플랫폼을 선택해 주십시요');
		$('#PC').focus();
		returnStr = false;
	}	
	
	if(  returnStr  &&  !$("#comFileUploader0").val()){
		alert('파일을 선택해 주십시요');
		returnStr = false;
	}	
	
	if(  returnStr  &&  trimNvl( $("#url").val() )){
		alert('링크를 입력해 주십시요');
		$('#url').focus();
		returnStr = false;
	}	
	
	if(  returnStr  &&  trimNvl( $("#order").val() )){
		alert('순서를 입력해 주십시요');
		$('#order').focus();
		returnStr = false;
	}	
	
	return returnStr;	
}


</script>
</head>
<body>

	<div class="contWarp">

		<div class="contents">
			<!-- contents  -->
			<form action="" method="post" name="frm" id="frm" enctype="multipart/form-data">
			<input type="hidden" name="seq" id="seq" value="<c:out value='${detail.seq}'/>"/>
			<input type="hidden" name="atchFileId" id="atchFileId"   value="<c:out value="${detail.atch_file_id}" />" />
			<c:choose>
				<c:when test="${empty detail.creation_user}">
          			<input type="hidden" name="bannerAdder" id="bannerAdder" value="<c:out value='${admin.id}'/>"/>
				</c:when>
				<c:otherwise>
          			<input type="hidden" name="bannerAdder" id="bannerAdder" value="<c:out value='${admin.id}'/>"/>
				</c:otherwise>
			</c:choose>
			
			<div class="write">
				<table class="tableSt_02">
					<colgroup>
						<col style="width:12%" />
						<col style="width:38%" />
					</colgroup>
					<tbody>
						
						<tr>
							<th>사용유무</th>
				            <td>
						        <c:choose>
								    <c:when test="${detail.USE_YN eq 'Y'}">
						              	<input type="radio" name="use" id="use" value="Y" style="width:20px;" checked="checked"><label for="use">사용</label> 
						              	<input type="radio" name="use" id="unused" value="N"style="width:20px;"><label for="unused">미사용</label>
								    </c:when>
								    <c:when test="${detail.USE_YN ne 'N'}">
						              	<input type="radio" name="use" id="use" value="Y" style="width:20px;"><label for="use">사용</label> 
						              	<input type="radio" name="use" id="unused" value="N"style="width:20px;" checked="checked"><label for="unused">미사용</label>
								    </c:when>
								    <c:otherwise>
						              	<input type="radio" name="use" id="use" value="Y" style="width:20px;"><label for="use">사용</label> 
						              	<input type="radio" name="use" id="unused" value="N"style="width:20px;"><label for="unused">미사용</label>
								    </c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>플랫폼</th>
				            <td>
						        <c:choose>
								    <c:when test="${detail.PLAY_GUBUN eq 'P'}">
						              	<input type="radio" name="platform" id="PC" value="P" style="width:20px;" checked="checked"><label for="PC">PC</label> 
						              	<input type="radio" name="platform" id="Mobile" value="M"style="width:20px;"><label for="Mobile">Mobile</label>
								    </c:when>
								    <c:when test="${detail.PLAY_GUBUN eq 'M'}">
						              	<input type="radio" name="platform" id="PC" value="P" style="width:20px;"><label for="PC">PC</label> 
						              	<input type="radio" name="platform" id="Mobile" value="M"style="width:20px;" checked="checked"><label for="Mobile">Mobile</label>
								    </c:when>
								    <c:otherwise>
						              	<input type="radio" name="platform" id="PC" value="P" style="width:20px;"><label for="PC">PC</label> 
						              	<input type="radio" name="platform" id="Mobile" value="M"style="width:20px;"><label for="Mobile">Mobile</label>
								    </c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>대표 이미지</th>
							<td   class="attachFile" id="file_0">
								
								<p><input  name="file_0" id="comFileUploader0" type="file" title="썸네일파일입력"/><span> 파일용량 10MB이하</span></p>
								<p id="comFileList0">
				                 	   <c:import url="/cmm/selectFileInfsForUpdate.do" charEncoding="utf-8"  >
											<c:param name="maxFileNum" value="1" />
											<c:param name="thumbnail" value="Y" />		
											<c:param name="fileSn" value="0" />
											<c:param name="param_atchFileId" value="${detail.atch_file_id}" />
										</c:import>
								</p>
							</td>
						</tr>
						<tr>
							<th>링크</th>
							<td>
								<input type="url" name="url" id="url" value="<c:out value="${detail.LINK_URL}"/>"  maxlength="50"  style="width:500px;"/>
							</td>
						</tr>
						<tr>
							<th>순서</th>
							<td>
								<input type="number" name="order" id="order" value="<c:out value="${detail.ORDER_SORT}"/>"  maxlength="50"  style="width:500px;"/>
							</td>
						</tr>
						
					</tbody>
				</table>
				<div class="btnSec">
					<div class="leftBtn">
						<button type="button" onclick="go_list();" class="btn type_02">목록</button>
					</div>
					<div class="rightBtn">
						<button type="button" onclick="write_proc();" class="btn type_01 active">저장</button>
					</div>
					<c:if test="${!empty detail.seq}">
						<div class="rightBtn">
							<button type="button" onclick="del_proc();" class="btn type_01 active" style="margin-right: 20px;">삭제</button>
						</div>
					</c:if>
				</div>
			</div>
			

			<!-- //contents  -->
			</form>
			
			<form name="frmParam" id="frmParam" method="post">
				<c:forEach items="${param}" var="pL" varStatus="status">
					<input type="hidden" id="${pL.key }"  name="${pL.key }"  value="<c:out value="${pL.value }"  />" />	
				</c:forEach>
			</form>
						
		</div>
	</div>
	
</body>