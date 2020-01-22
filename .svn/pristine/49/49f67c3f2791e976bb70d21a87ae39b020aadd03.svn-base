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
<script type="text/javascript" src="/smarteditor/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript">
		//삭제
		function del_proc(){
			if('${detail.seq}' != ''){
				if(confirm("삭제하시겠습니까?")){
					$.ajax({
						type : "post",			
						url : "/admin/board/notice/del_proc.json",
						dataType : 'json',
						data: $("#frm").serialize() ,
						success : function(data) {
							$('#ajax_load_indicator').hide();			
							
							if ( data.success){
								alert("정상적으로 삭제하였습니다.");
								go_list();
							}else{
								alert(data.message);
							}
						
						}
					});
				}
			}else{
				alert("삭제될 내용이 없습니다.");
			}
		}
	//리스트 페이지 이동
	function go_list() {
		$("#frmParam").attr("action" , "list.do");
		$("#frmParam").submit();
	}	
	  function write_proc(){
 		//fn_egov_file_name();
		$("#contents").val(oEditors.getById["contents"].getIR());
		
		if ( isValid() && confirm("저장하시겠습니까?")){
				var option = {
						type : "post",
						url: "/admin/board/notice/write_proc.json",
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

	function isValid(){
		var returnStr = true;

		$("#title").val(wordchk2($("#title").val()));
		$("#contents").val(wordchk2($("#contents").val()));
		
		if(  returnStr  &&  trimNvl( $("#title").val() )){
			alert('제목을 입력해 주십시요');
			$('#title').focus();
			returnStr = false;
		}	
		
		if(  returnStr && ($("#contents").val() == '<p><br></p>' || $("#contents").val() == '')){
			alert('내용을 입력해 주십시요.');
			$('#contents').focus();
			returnStr = false;
		}

		return returnStr;	
	}
  </script>
</head>

<body>
  <div class="section">
    <h2>공지사항 글쓰기</h2>
    <div class="breadcrumbs">
      <a href="#" class="home"><span>home</span></a>
      <span>게시판관리</span>
      <span>공지사항</span>
      <span>공지사항 글쓰기</span>
    </div>
	<form method="post" name="frm" id="frm" enctype="multipart/form-data">
	  <input type="hidden" name="seq" id="seq" value="<c:out value='${detail.seq}'/>">
	  <div class="section-main">
	      <table class="notice-writing">
	        <tr>
	          <td class="list-title title">제목</td>
	          <td class="title-name"><input type="text" name="title" id="title"  value="<c:out value='${detail.title}'/>"></td>
	          <td class="list-title writer">글쓴이</td>
	          <td class="name">
				<c:choose>
					<c:when test="${empty detail.creation_user}">
	          			<input type="hidden" name="adminName" id="adminName" value="<c:out value='${admin.id}'/>"/>
						<c:out value='${admin.id}'/>
					</c:when>
					<c:otherwise>
	          			<input type="hidden" name="adminName" id="adminName" value="<c:out value='${admin.id}'/>"/>
						<c:out value='${detail.creation_user}'/>
					</c:otherwise>
				</c:choose>
			  </td>
	        </tr>
	        <tr>
	          <td class="list-title flex">상단고정</td>
				<c:choose>
					<c:when test="${detail.notice_yn eq 'Y'}">
						<td class="check" colspan="3"><input class="check" name="topYn" id="topYn" value="Y" type="checkbox" checked="checked"></td>
					</c:when>
					<c:otherwise>
						<td class="check" colspan="3"><input class="check" name="topYn" id="topYn" value="Y" type="checkbox"></td>
					</c:otherwise>
				</c:choose>
	        </tr>
	        <tr>
	          <td class="content" colspan="4">
	            <textarea name="contents" id="contents" cols="30" rows="10"><c:out value="${detail.contents}" escapeXml="false"/></textarea>
					<script type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
							oAppRef : oEditors,
							elPlaceHolder : "contents",
							sSkinURI : "/smarteditor/SmartEditor2Skin.html",
							htParams : {
								// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
								bUseToolbar : true,
								// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
								bUseVerticalResizer : true,
								// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
								bUseModeChanger : true,
								fOnBeforeUnload : function() {
								},
							}
						});
					</script>
	          </td>
	        </tr>
	        <tr class="board-footer">
<!-- 	          <td>첨부파일</td> -->
<!-- 	          <td colspan="3"><input type="file"><button>삭제</button></td> -->
          <td class="title">첨부파일</td>
	          <td colspan="3" class="attachFile" id="file_0">	
					<p><input  name="file_0" id="comFileUploader0" type="file" title="썸네일파일입력"/><span> 파일용량 10MB이하</span></p>
					<p id="comFileList0">
	               	   <c:import url="/cmm/selectFileInfsForUpdate.do" charEncoding="utf-8"  >
						<c:param name="maxFileNum" value="1" />
						<c:param name="thumbnail" value="N" />		
						<c:param name="fileSn" value="0" />
						<c:param name="param_atchFileId" value="${detail.atch_file_id}" />
					   </c:import>
					</p>
				</td>
	        </tr>
	      </table>
	      <button class="del" onclick="del_proc()">삭제</button><button type="button" class="update" onclick="write_proc()">확인</button>
	    </div>
	  </form>
	</div>
	<form name="frmParam" id="frmParam" method="post">
		<c:forEach items="${param}" var="pL" varStatus="status">
			<input type="hidden" id="${pL.key }"  name="${pL.key }"  value="<c:out value="${pL.value }"  />" />	
		</c:forEach>
	</form>
</body>

</html>