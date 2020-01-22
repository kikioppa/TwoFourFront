<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<html>
<head>
<title>Push 발송  관리</title>
<script>
$(function(){
	contents_check();
});

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
		alert('제목을 입력해 주십시요');
		$('#title').focus();
		returnStr = false;
	}	
	
	if(  returnStr  &&  trimNvl( $("#message").val() )){
		alert('메세지를 입력해 주십시요');
		$('#message').focus();
		returnStr = false;
	}	
	
	if(  returnStr  &&  trimNvl( $("#reserveTime").val() )){
		alert('발송예약시간을 입력해 주십시요');
		$('#reserveTime').focus();
		returnStr = false;
	}	
	
	if(  returnStr  &&  trimNvl( $("#pushFlag").val() )){
		alert('Push 종류를 선택해 주십시요');
		$('#pushFlag').focus();
		returnStr = false;
	}	
	
	if(  returnStr  &&  trimNvl( $("#contentsFlag").val()) && $("#pushFlag").val() == 'D' ){
		alert('컨텐츠를 선택해 주십시요');
		$('#contentsFlag').focus();
		returnStr = false;
	}	
	
	if(  returnStr  &&  trimNvl( $("#pushUrl").val()) && $("#pushFlag").val() != 'N' ){
		alert('이동 URL을 입력해 주십시요');
		$('#pushUrl').focus();
		returnStr = false;
	}	
	
	if($("#pushFlag").val() != 'D'){
		$('#contentsFlag').val('');
	}
	
	if($("#pushFlag").val() == 'N'){
		$('#contentsFlag').val('');
		$('#pushUrl').val('');
	}
	
	
	return returnStr;	
}

function contents_check(){
	if($("#pushFlag").val() == 'D'){
		$("#contentsTr").show();
	}else{
		$("#contentsTr").hide();
	}
}

</script>
</head>
<body>

	<div class="contWarp">

		<div class="contents">
			<!-- contents  -->
			<form method="post" name="frm" id="frm" enctype="multipart/form-data">
			<input type="hidden" name="seq" id="seq" value="<c:out value='${detail.seq }'/>"/>
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
							<th>제목</th>
							<td colspan="3">
								<input type="text" name="title" id="title" value="<c:out value="${detail.title}"/>"  maxlength="100"  style="width:500px;"/>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">
								<input type="text" name="message" id="message" value="<c:out value="${detail.message}"/>"  maxlength="100"  style="width:500px;"/>
							</td>
						</tr>
						<tr>
							<th>발송예약시간</th>
							<td colspan="3">
								<input type="text" id="reserveTime" name="reserveTime" style="padding-left:10px;" value="<fmt:formatDate value="${detail.reserve_time }" pattern="yyyy.MM.dd HH:mm"/>"  class="tag datetime"  readonly/>
							</td>
						</tr>
						<tr>
							<th>Push 종류</th>
							<td>
								<select name="pushFlag" id="pushFlag" onchange="contents_check()">
									<option value="">선택</option>
									<option value="N" <c:if test="${detail.push_flag eq 'N'}">selected</c:if> >앱실행</option>
									<option value="U" <c:if test="${detail.push_flag eq 'U'}">selected</c:if> >외부링크</option>
<%-- 									<option value="D" <c:if test="${detail.push_flag eq 'D'}">selected</c:if> >컨텐츠</option> --%>
								</select>
							</td>
							<th colspan="2"><span>*앱실행 : 앱 메인화면 접속, 외부링크 : 특정 URL 접속</span></th>
<!-- 							<th colspan="2"><span>*앱실행 : 앱 메인화면 접속, 외부링크 : 특정 URL 접속, 컨텐츠 : 컨텐츠 특정 글 상세보기</span></th> -->
						</tr>
						<tr>
							<th>이미지</th>
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
						<tr id="contentsTr">
							<th>컨텐츠 종류</th>
							<td colspan="3">
								<select name="contentsFlag" id="contentsFlag">
									<option value="">선택</option>
									<option value="J" <c:if test="${detail.contents_flag eq 'J'}">selected</c:if>>전북여행100선</option>
									<option value="T" <c:if test="${detail.contents_flag eq 'T'}">selected</c:if>>전북토탈관광</option>
									<option value="F" <c:if test="${detail.contents_flag eq 'F'}">selected</c:if>>농촌관광</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>이동 URL</th>
							<td colspan="3">
								<input type="text" name="pushUrl" id="pushUrl" value="<c:out value="${detail.push_url}"/>"  maxlength="100"  style="width:500px;"/>
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