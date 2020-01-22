<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>관리자 페이지-권한관리</title>
  
  <script type="text/javascript" src="${web_server_url}/js/core.min.js"></script>
  <script type="text/javascript" src="${web_server_url}/js/sha256.min.js"></script>
  <script type="text/javascript" src="${web_server_url}/js/admin.js"></script>
  <script type="text/javascript">
  $(function(){
	  $(document).on("keyup", "input:text[engOnly]", function() {
		  $(this).val( $(this).val().replace(/^[ㄱ-힣\s]+$/,"") );
	  });
  })
  
  function fn_write(){
	if ( isValid() && confirm("저장하시겠습니까?")){
		var culAuth = '';
		$("input[name=authCheck]").each(function() {
			var chkbox = '0';
			if($(this).is(":checked")){
				chkbox = '1';
			}
			culAuth = culAuth + '|' + chkbox 
		})
		
		$("#culAuth").val(culAuth.substring(1));
		
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
		$("#position").val(wordchk2($("#position").val()));
		$("#culName").val(wordchk2($("#culName").val()));
		$("#culId").val(wordchk2($("#culId").val()));
		
		if(  returnStr  &&  trimNvl( $("#position").val() )){
			alert('권한명을 입력해 주십시요.');
			$('#position').focus();
			returnStr = false;
		}	
		
		
		if(  returnStr  &&  trimNvl( $("#culName").val() )){
			alert('이름을 입력해 주십시요.');
			$('#culName').focus();
			returnStr = false;
		}	
		
		if(  returnStr  &&  trimNvl( $("#culId").val() )){
			alert('아이디를 입력해 주십시요.');
			$('#culId').focus();
			returnStr = false;
		}	
		
		if($("#seq").val() == ""){
			if(  returnStr  &&  trimNvl( $("#culPass").val() )){
				alert('패스워드를 입력해 주십시요.');
				$('#culPass').focus();
				returnStr = false;
			}	
			
			$("#culPass").val(CryptoJS.SHA256(pwEncode($('#culId').val().trim(), $('#culPass').val().trim())).toString());	
		}else{
			if($("#culPass").val() != ""){
				$("#culPass").val(CryptoJS.SHA256(pwEncode($('#culId').val().trim(), $('#culPass').val().trim())).toString());
			}else{
				$("#culPass").val($("#beforeCulPass").val());
			}
		}
		
		
		return returnStr;	
	}
  
  function go_list(){
	  $("#frm").attr("action","list.do")
	  $("#frm").submit();
  }
  </script>
</head>

<body>
  <!--section-->
  <form name="frm" id="frm" action="post">
  	  <input type="hidden" name="culAuth" id="culAuth" value="" />
  	  <input type="hidden" name="seq" id="seq" value="<c:out value='${detail.SEQ }' />" />
  	  <input type="hidden" name="beforeCulPass" id="beforeCulPass" value="<c:out value='${detail.CUL_PASSWORD }' />" />
  	  
	  <div class="info-section">
	    <div class="enter-date-list">
	      <ul>
	        <li>권한명</li>
	        <li><input type="text" id="position" name="position" maxlength="20" value="<c:out value="${detail.POSITION }" />" ></li>
	        <li>이름</li>
	        <li><input type="text" id="culName" name="culName" maxlength="10" value="<c:out value="${detail.CUL_NAME }" />" ></li>
	        <li>아이디</li>
	        <li><input type="text" id="culId" name="culId" maxlength="50" engOnly value="<c:out value="${detail.CUL_ID }" />" <c:if test="${not empty detail.seq }">readonly</c:if> ></li>
	        <li>비밀번호</li>
	        <li><input type="password" id="culPass" name="culPass" maxlength="20" ></li>
	      </ul>
	    </div>
	    <div class="grant-check-list">
	      <c:set var="authArr" value="${fn:split(detail.CUL_AUTH,'|')}" />
	      <ul>
	        <li><input type="checkbox" name="authCheck" <c:if test="${authArr[0] eq '1' }">checked</c:if> >회원관리권한</li>
	        <li><input type="checkbox" name="authCheck" <c:if test="${authArr[1] eq '1' }">checked</c:if> >매입처리관리권한</li>
	        <li><input type="checkbox" name="authCheck" <c:if test="${authArr[2] eq '1' }">checked</c:if> >게시판관리권한</li>
	        <li><input type="checkbox" name="authCheck" <c:if test="${authArr[3] eq '1' }">checked</c:if> >권한관리권한</li>
	        <li><input type="checkbox" name="authCheck" <c:if test="${authArr[4] eq '1' }">checked</c:if> >통계관리권한</li>
	        <li><input type="checkbox" name="authCheck" <c:if test="${authArr[5] eq '1' }">checked</c:if> >전시관리권한</li>
	      </ul>
	    </div>
	    <div class="grant-btn">
	      <div class="gray-btn"><a href="javascript:go_list();">목록</a></div>
	      <div class="save-btn gray-btn"><a href="javascript:fn_write();">저장</a></div>
	    </div>
	  </div>
  </form>
</body>

</html>