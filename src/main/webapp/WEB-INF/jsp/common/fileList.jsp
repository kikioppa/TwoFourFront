<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<%

/**
  * @Class Name : fileList.jsp
  * @Description : 파일 목록화면
  *	@author : jsnoh
  *
  */
%>
<c:set var="uriIndexOf" value="${fn:indexOf(pageContext.request.requestURI  ,'write.jsp' ) }" />
<c:set var="isForm" value="N" />
<c:if test="${uriIndexOf > -1 }" ><c:set var="isForm" value="Y" /></c:if>

<script type="text/javascript">

	$(function(){
		<c:if test= "${isForm eq 'Y' }" >
		try{	
			makeFileAttachment<c:out value="${fileSn}"/>();
		}catch(e){
		}
		</c:if>
			
	});
	
	//파일업로드 갯수 제한
	function makeFileAttachment<c:out value="${fileSn}"/>(){
		
		
		var existFileNum = parseInt('<c:out value="${fileListCnt}"   default="0"  escapeXml="false" />');
		var maxFileNum = $("#posblAtchFileNumber").val();
		
	
		if (existFileNum=="undefined" || existFileNum ==null) {
			existFileNum = 0;
		}
		if (maxFileNum=="undefined" || maxFileNum ==null) {
			maxFileNum = parseInt('<c:out value="${param.maxFileNum}"   default="1"  escapeXml="false" />');
		}
		
		
		
		var uploadableFileNum = maxFileNum - existFileNum;
		if (uploadableFileNum<0) {
			uploadableFileNum = 0;
		}
		

		
		if (uploadableFileNum != 0) {
			fn_egov_check_file<c:out value="${fileSn}"/>('Y');
			try{
				var multi_selector = new MultiSelector( document.getElementById( 'comFileList<c:out value="${fileSn}"/>' ), uploadableFileNum );
				multi_selector.addElement( document.getElementById( 'comFileUploader<c:out value="${fileSn}"/>' ) );
			}catch(e){
				console.log(e);
			}
		} else {
			fn_egov_check_file<c:out value="${fileSn}"/>('N');
		}
		

		
		
		var thisUrl = location.href;
		var thisForm = $(".egovFile").parents("form");
		form = thisForm.get(0);		
		
	
		
		if (typeof(form.returnUrl) == "undefined" ){
			thisForm.append('<input type="hidden" name="returnUrl" value="'+thisUrl+'">');
		}else{
			form.returnUrl.value=thisUrl;
		}
		
		if (typeof(form.atchFileId) == "undefined" ){
			thisForm.append('<input type="hidden" name="atchFileId" value="${atchFileId}">');
		}else{
			form.atchFileId.value="${atchFileId}";
		}
		

		
		if (typeof(form.fileListCnt) == "undefined" ){
			thisForm.append('<input type="hidden" name="fileListCnt" value="<c:out value="${fileListCnt}"   default="0"  escapeXml="false" />">');
		}else{
			form.fileListCnt.value=parseInt('<c:out value="${fileListCnt}"   default="0"  escapeXml="false" />');
		}
		
	
		
	}


	function fn_downFile<c:out value="${fileSn}"/>(atchFileId, fileSn){
		window.open("<c:url value='${web_server_url}/cmm/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
	}

	function fn_deleteFile<c:out value="${fileSn}"/>(atchFileId, fileSn) {
		if ( confirm("파일을 삭제 하시겠습니까?")){

			
			var thisUrl = location.href;
			var thisForm = $(".egovFile").parents("form");
			form = thisForm.get(0);		
			
			
			
			if (typeof(form.returnUrl) == "undefined" ){
				thisForm.append('<input type="hidden" name="returnUrl" value="'+thisUrl+'">');
			}else{
				form.returnUrl.value=thisUrl;
			}
			
			if (typeof(form.atchFileId) == "undefined" ){
				thisForm.append('<input type="hidden" name="atchFileId" value="${atchFileId}">');
			}else{
				form.atchFileId.value="${atchFileId}";
			}
			
			if (typeof(form.fileSn) == "undefined" ){
				thisForm.append('<input type="hidden" name="fileSn" value="'+fileSn+'">');
			}else{
				form.fileSn.value=fileSn;
			}
			
			if (typeof(form.fileStreCours) == "undefined" ){
				thisForm.append('<input type="hidden" name="fileStreCours" value="'+$("#fileStreCours_"+fileSn).val()+'">');
			}else{
				form.fileStreCours.value=$("#fileStreCours_"+fileSn).val();
			}
			
			if (typeof(form.streFileNm) == "undefined" ){
				thisForm.append('<input type="hidden" name="streFileNm" value="'+$("#streFileNm_"+fileSn).val()+'">');
			}else{
				form.streFileNm.value=$("#streFileNm_"+fileSn).val();
			}
			
			
			form.action = "<c:url value='${web_server_url}/cmm/deleteFileInfs.do'/>";
			form.submit();
		}
	}

	function fn_egov_check_file<c:out value="${fileSn}"/>(flag) {
		

		
		try{
			if (flag=="Y") {			
				//document.getElementById('comFileUploader<c:out value="${fileSn}"/>').style.display = "initial";
				$("#comFileUploader<c:out value="${fileSn}"/>").parent().show();
			} else {			
				//document.getElementById('comFileUploader<c:out value="${fileSn}"/>').style.display = "none";
				$("#comFileUploader<c:out value="${fileSn}"/>").parent().hide();
			}
		}catch(e){
			console.log(e);
		}
	}
</script>



	<div>
	<table class="file egovFile">
		<c:forEach var="fileVO" items="${fileList}" varStatus="status">
		<tr>
			<td style="border:0;">
			<c:choose>
				<c:when test="${updateFlag=='Y'}">
					
					<c:choose>
						<c:when test="${thumbnail eq 'Y' }"><!-- 썸네일 -->
							<img src="<c:out value="${ndn:getImgUrl(fileVO.fileStreCours , fileVO.streFileNm ) }"/>"   alt="<c:out value="${fileVO.orignlFileNm}"/>" /> <br/>
						</c:when>
						<c:otherwise>
							<img src="<c:url value="${web_server_url}/images/ico/ico_file2.png"/>" alt="파일 아이콘" class="text_n_ico"/>
						</c:otherwise>
					</c:choose>
					<a href="javascript:fn_downFile<c:out value="${fileSn}"/>('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')"  class="fileDown" >
					<c:out value="${fileVO.orignlFileNm}"/>&nbsp;[
																								<c:choose>
																									<c:when test="${fileVO.fileMg >=1048576}" >
																										<fmt:formatNumber value="${fileVO.fileMg/1048576}" pattern="#.#" />&nbsp;MB	
																									</c:when>
																									<c:when test="${fileVO.fileMg >=1000}" >
																										<fmt:formatNumber value="${fileVO.fileMg/1000}" pattern="#.#" />&nbsp;KB
																									</c:when>
																									<c:otherwise>
																										<fmt:formatNumber value="${fileVO.fileMg}"  />&nbsp;byte
																									</c:otherwise>
																								</c:choose>
																							]
					
					</a>
					<img src="<c:url value='${web_server_url}/images/ico/bu5_close.png' />" class="${updateFlag}" 
						width="15" height="15" onClick="fn_deleteFile<c:out value="${fileSn}"/>('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>');" title="파일삭제"  style="cursor: pointer;">
						<input type="hidden" id="fileStreCours_<c:out value="${fileVO.fileSn}"/>"  value="<c:out value="${fileVO.fileStreCours}"/>">
						<input type="hidden" id="streFileNm_<c:out value="${fileVO.fileSn}"/>"  value="<c:out value="${fileVO.streFileNm}"/>">
						
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${thumbnail eq 'Y' }"><!-- 썸네일 -->
							<img src="<c:out value="${ndn:getImgUrl(fileVO.fileStreCours , fileVO.streFileNm ) }"/>"   alt="<c:out value="${fileVO.orignlFileNm}"/>" /> <br/>
						</c:when>
						<c:otherwise>
							<img src="<c:url value="/images/ico/ico_file2.png"/>" alt="파일 아이콘" class="text_n_ico"/>
						</c:otherwise>
					</c:choose>	
					
					
					<a href="javascript:fn_downFile<c:out value="${fileSn}"/>('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')"  class="fileDown" >
					<c:out value="${fileVO.orignlFileNm}"/>&nbsp;[
																								<c:choose>
																									<c:when test="${fileVO.fileMg >=1048576}" >
																										<fmt:formatNumber value="${fileVO.fileMg/1048576}" pattern="#.#" />&nbsp;MB	
																									</c:when>
																									<c:when test="${fileVO.fileMg >=1000}" >
																										<fmt:formatNumber value="${fileVO.fileMg/1000}" pattern="#.#" />&nbsp;KB
																									</c:when>
																									<c:otherwise>
																										<fmt:formatNumber value="${fileVO.fileMg}"  />&nbsp;byte
																									</c:otherwise>
																								</c:choose>
																							] 
					</a>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		</c:forEach>
		<c:if test="${fn:length(fileList) == 0}">
	    </c:if>
	</table>
	</div>