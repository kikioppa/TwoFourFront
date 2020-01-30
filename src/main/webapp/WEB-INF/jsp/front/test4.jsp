<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script>

 function resetPassword(resetPassword){
	 
	 var result = confirm("비밀번호를 초기화 하시겠습니까?");
	 if(result == true){
		 alert("계속 진행합니다");
		 }
	 
	 else {
		 alert("취소 합니다");
	return;	 
	 }
	 
	 $("#resetPassword").val(resetPassword);
	 
	 var option = {
			type : "post",
			url: './resetPassword.json',
			data: $("#frm").serialize() ,
			dataType: 'json',
			beforeSend: function() {
				$('#ajax_load_indicator').show();
			},
			success : function(data) {
				if(data.success){
					alert('성공하였습니다.');
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
</script>


</head>
<body>





	<div class="consent-btn">
		<button type="button"
			onclick="resetPassword('<c:out value="${detail.MEMBER_PASSWORD}"/>')">비밀번호
			재발급</button>
	</div>






</body>
</html>