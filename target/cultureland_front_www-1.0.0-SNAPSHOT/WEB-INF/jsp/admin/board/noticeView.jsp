<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/smarteditor/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
<title>게시판 관리</title>
<script type="text/javascript">
function isValid(){
	var returnStr = true;
	
	if(  returnStr  &&  trimNvl( $("#title").val() )){
		alert('제목을 입력해 주십시요.');
		$('#title').focus();
		returnStr = false;
	}	
	
	if(  returnStr && ($("#contents").val() == '<p><br></p>' || $("#contents").val() == '')){
		alert('내용을 입력해 주십시요.');
		$('#contents').focus();
		returnStr = false;
	}
	
	var fileName = $("#comFileUploader").val();
	var len = fileName.slice(fileName.lastIndexOf(".") + 1).toLowerCase();
	if(fileName != ""){
		if (len != 'pdf' && len != 'docx' && len != 'doc' && len != 'ppt' && len != 'pptx') {
			alert("첨부파일은 확장자가  pdf, docx, doc, ppt, pptx 인 파일만 올릴 수 있습니다.");
			$('#comFileUploader').focus();
			returnStr = false;
		}
		
	}
	
	
	var fileName2 = $("#comFileUploader1").val();
	var len2 = fileName2.slice(fileName2.lastIndexOf(".") + 1).toLowerCase();
	if(fileName2 != ""){
		if (len2 != 'pdf' && len2 != 'docx' && len2 != 'doc' && len2 != 'ppt' && len2 != 'pptx') {
			alert("첨부파일은 확장자가  pdf, docx, doc, ppt, pptx 인 파일만 올릴 수 있습니다.");
			$('#comFileUploader1').focus();
			returnStr = false;
		}
		
	}
	
	
	return returnStr;	
}

function fn_write(){

	$("#contents").val(oEditors.getById["contents"].getIR());
	$("#useYn").val($("input[name=is_valid_YN]:checked").val());
	
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

function go_list(){
	$("#frm").attr("action","list.do")
	$("#frm").submit();
}

function fn_delete(){
	if (confirm("삭제하시겠습니까?")){
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
						alert('삭제되였습니다.');
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
</script>
</head>
<body>
<h1 style="font-weight: bold;font-size: 200%;">게시판 관리 - 공지사항</h1>
<div class="contWarp">
	<div class="contents">
		<form method="post" id="frm" name="frm" enctype="multipart/form-data">
			<input type="hidden" name="seq" id="seq" value="<c:out value="${detail.seq}" />" >
			<input type="hidden" name="useYn" id="useYn" value="<c:out value="${detail.useYn}" />" >
			<input type="hidden" name="curPage" id="curPage"  value="<c:out value="${param.curPage }"/>" />
			<input type="hidden" id="gubun"  name="gubun" value="<c:out value="${gubun }"/>" />
			<input type="hidden" id="atchFileId" name="atchFileId" value="${detail.atch_file_id}">
			<div class="write">
				<table class="tableSt_02">
					<colgroup>
						<col style="width:101px;" />
						<col style="width:679px;" />
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" name="title" id="title" value="<c:out value="${detail.title}"/>"  maxlength="100" >
							</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>
								<select name="category" id="category">
									<c:forEach items="${cateList}" var="list" varStatus="status">
										<option value="${list.gubun}" <c:if test="${list.gubun eq detail.category}">selected</c:if>  >
											<c:out value="${list.gubun_name}" />
										</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea cols="30" id="contents" name="contents" rows="20" style="width:99%;text-indent:5px;">${detail.contents}</textarea>
								<script type="text/javascript">
									var oEditors = [];
								    nhn.husky.EZCreator.createInIFrame({
								        oAppRef: oEditors,
								        elPlaceHolder: "contents",
								        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
								        htParams : {
								            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
								            bUseToolbar : true,            
								            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
								            bUseVerticalResizer : true,    
								            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
								            bUseModeChanger : true,
								            fOnBeforeUnload:function(){},
								        }
								    });
								</script>
							</td>
						</tr>
						<tr>
							<th>첨부 파일</th>
							<td>
								<p><input name="file_1" id="comFileUploader" type="file" title="첨부파일입력"/></p>
								<p><input name="file_2" id="comFileUploader1" type="file" title="첨부파일입력"/><span> 파일용량 10MB이하, 첨부최대 2개</span></p>
								<p id="comFileList">
									
										<c:import url="/cmm/selectFileInfsForUpdate.do" charEncoding="utf-8">
											<c:param name="maxFileNum" value="2" />
											<c:param name="thumbnail" value="N" />
											<c:param name="param_atchFileId" value="${detail.atch_file_id}" />
										</c:import>
									
								</p>
							</td>
						</tr>
						
						<tr>
							<th>노출 여부</th>
							<td>
								<input type="radio" name="is_valid_YN"  value="Y" class="radio"<c:if test="${detail.use_yn eq 'Y' || empty detail.use_yn }">checked</c:if> ><label for="is_valid_Y" >노출</label>
								<input type="radio" name="is_valid_YN"  value="N" class="radio"<c:if test="${detail.use_yn eq 'N'}">checked</c:if> ><label for="is_valid_N" >비노출</label>
							</td>
						</tr>
						
					</tbody>
				</table>
			
				<div class="btnSec">
					<div class="leftBtn">
						<c:if test="${not empty detail.seq }">
							<button type="button" onclick="fn_delete();" class="btn type_02">삭제하기</button>
						</c:if>
					</div>
					<div class="rightBtn">
						<button type="button" onclick="fn_write();" class="btn type_01">
							<c:choose>
								<c:when test="${empty detail.seq }">등록</c:when>
								<c:otherwise>수정</c:otherwise>
							</c:choose>
						</button>
						<button type="button" onclick="go_list();" class="btn type_02">목록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>