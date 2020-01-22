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


function fn_write(){
	
	fn_egov_file_name();
	
	$("#atchFileId").val("${detail.atch_file_id}");
	
	
	if ( isValid() && confirm("저장하시겠습니까?")){
				
				var option = {
						type : "post",
						url: './write_proc.json',
						data: $("#frm").serialize() ,
						dataType: 'json',
						beforeSend: function() {
							$('#ajax_load_indicator').show();
						},
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
						},
						complete : function() {
							$('#ajax_load_indicator').hide();
						}
					};
			
					$("#frm").ajaxSubmit(option);
					
	}
	
	

	
}


function isValid(){
	var returnStr = true;
	
	if(  returnStr  &&  trimNvl( $("#title").val() )){
		alert('장소명을 입력해 주십시요');
		$('#title').focus();
		returnStr = false;
	}	
	
	if(  returnStr  &&  trimNvl( $("#category").val() )){
		alert('카테고리를 선택해 주십시요');
		$('#category').focus();
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
			<form method="post" name="frm" id="frm" enctype="multipart/form-data">
			<input type="hidden" name="seq" id="seq" value="<c:out value='${detail.seq }'/>"/>
			<input type="hidden" name="atchFileId" id="atchFileId"   value="<c:out value="${detail.atch_file_id}" />" />
			<input type="hidden" name="atchIconId" id="atchIconId"   value="<c:out value="${detail.atch_icon_id}"  />" />
<%-- 			<input type="hidden" name="returnUrl" id="returnUrl" value="<c:url value='${adminUri}contents/place/write.do'/>"/> --%>
			
			<div class="write">
				<table class="tableSt_02">
					<colgroup>
						<col style="width:12%" />
						<col style="width:38%" />
						<col style="width:12%" />
						<col style="width:38%" />
					</colgroup>
					<tbody>
						
						<tr>
							<th>장소명</th>
							<td colspan="3">
								<input type="text" name="title" id="title" value="<c:out value="${detail.title}"/>"  maxlength="50"  style="width:500px;"/>
							</td>
						</tr>
						
						<tr>
							<th>카테고리</th>
							<td colspan="3">
								<select name="category" id="category">
									<option value="">선택</option>
									<option value="I" <c:if test="${detail.category eq 'I' }">selected</c:if> >Info</option>
									<option value="E" <c:if test="${detail.category eq 'E' }">selected</c:if>>먹고</option>
									<option value="P" <c:if test="${detail.category eq 'P' }">selected</c:if>>놀고</option>
									<option value="S" <c:if test="${detail.category eq 'S' }">selected</c:if>>자고</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<th>지형지물</th>
							<td colspan="3">
								<input type="checkbox" name="geographic" id="geographic" value="Y" style="width: 50px;" <c:if test="${detail.geographic eq 'Y' }">checked="checked"</c:if>>
							</td>
						</tr>
						
						<tr>
							<th>대표 이미지</th>
							<td colspan="3"   class="attachFile" id="file_0">
								
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
							<th>아이콘</th>
							<td colspan="3"   class="attachFile" id="file_1">
								
								<p><input  name="file_1" id="comFileUploader1" type="file" title="아이콘파일입력"/><span> 파일용량 10MB이하</span></p>
								<p id="comFileList1">
				                 	  
				                 	   <c:import url="/cmm/selectFileInfsForUpdate.do" charEncoding="utf-8"  >
										
											<c:param name="maxFileNum" value="1" />
											<c:param name="thumbnail" value="Y" />		
											<c:param name="fileSn" value="1" />
											<c:param name="param_atchFileId" value="${detail.atch_icon_id}" />
											
										</c:import>
				                 	  
								</p>
								
							</td>
						</tr>
						
						
						<tr>
							<th>지도</th>
							<td colspan="3">
								<input type="text" name="map" id="map" value="<c:out value="${detail.map}"/>"  maxlength="500"  style="width:350px;"/>
							</td>
						</tr>
						
						<tr>
							<th>위도</th>
							<td>
								<input type="text" name="latitude" id="latitude" value="<c:out value="${detail.latitude}"/>"  maxlength="20"  style="width:350px;"/>
							</td>
							<th>경도</th>
							<td>
								<input type="text" name="longitude" id="longitude" value="<c:out value="${detail.longitude}"/>"  maxlength="20"  style="width:350px;"/>
							</td>
							
						</tr>
						
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="address" id="address" value="<c:out value="${detail.address}"/>"  maxlength="250"  style="width:350px;"/>
							</td>
							<th>전화번호</th>
							<td>
								<input type="text" name="tel" id="tel" value="<c:out value="${detail.tel}"/>"  maxlength="20"  style="width:350px;"/>
							</td>
							
						</tr>
						
						<tr>
							<th>설명글</th>
							<td colspan="3">
								
								<textarea cols="30" id="placeDesc" name="placeDesc" rows="20" style="width:99%;text-indent:5px;">${detail.place_desc }</textarea>
								
							</td>
						</tr>
						
					</tbody>
				</table>
				<div class="btnSec">
					<div class="leftBtn">
						<button type="button" onclick="go_list();" class="btn type_02">목록</button>
					</div>
					<div class="rightBtn">
						<button type="button" onclick="fn_write();" class="btn type_01 active">저장</button>
					</div>
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