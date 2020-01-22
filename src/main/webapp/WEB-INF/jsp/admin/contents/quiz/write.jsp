<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<html>
<head>
<title>AR 퀴즈 관리</title>
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
	
	$("#answer").val($("input[name=is_answer_YN]:checked").val());
	
	if(  returnStr  &&  trimNvl( $("#quiz").val() )){
		alert('퀴즈를 입력해 주십시요');
		$('#quiz').focus();
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
			<input type="hidden" name="answer" id="answer" value="<c:out value='${detail.answer }'/>"/>
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
							<th>퀴즈</th>
							<td colspan="3">
								<input type="text" name="quiz" id="quiz" value="<c:out value="${detail.quiz}"/>"  maxlength="100"  style="width:500px;"/>
							</td>
						</tr>
						<tr>
							<th>정답</th>
							<td colspan="3">
								<input type="radio" name="is_answer_YN"  value="1" class="radio"<c:if test="${detail.answer eq '1' || empty detail.answer }">checked</c:if> ><label for="is_answer_Y" >O</label>
								<input type="radio" name="is_answer_YN"  value="0" class="radio"<c:if test="${detail.answer eq '0'}">checked</c:if> ><label for="is_answer_N" >X</label>
							</td>
						</tr>
						<tr>
							<th>설명글</th>
							<td colspan="3">
								
								<textarea cols="30" id="comment" name="comment" rows="20" style="width:99%;text-indent:5px;">${detail.comment }</textarea>
								
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