<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<head>
	<title>계좌인증</title>
	<script>
	function verifi_check(){
		if ( isValid() ){
			$.ajax({
				url: 'verifi_check.json',
				type: 'post',
				data: $("#frm").serialize() ,
				success : function(data) {
					console.log(data)
					if(data.success){
						$("#verifi").val(data.result);
						console.log('verifi : ' + $("#verifi").val());
						$("#frm").attr('action', '/m/myPage/myInfo.do');
						$("#frm").submit();
					}else{
						alert('비밀번호를 확인해주세요.');
					}
				},    		
 			})	
		}
	}
	
	function isValid(){
		var returnStr = true;

		
		if(  returnStr  &&  trimNvl( $("#pwd").val() )){
			alert('비밀번호를 입력해주세요.');
			$('#pwd').focus();
			returnStr = false;
		}	
		
		return returnStr;	
	}		
	</script>
</head>

<body>

	<div class="container account">
		<section class="account-form">
		<form name="frm" id="frm" method="post">
		<input type="hidden" name="id" id="id" value="<c:out value="${user.id}"/>"/>
		<input type="hidden" name="verifi" id="verifi" />
		  <div class="message-center">
		    고객님의 계좌정보를 확인/변경하는 페이지입니다.
		  </div>
		  <div class="input-text-wrap underline-type prefix-icon">
		    <span class="icon-password"></span>
		    <input type="password" placeholder="비밀번호" name="pw" id="pw">
		  </div>
		  <div class="btn-wrap">
		    <a href="#" onclick="verifi_check();" class="btn primary lg square">확인</a>
		  </div>
		  <div class="message-small">
		    <em>* 비밀번호는 항상 타인에게 노출되지 않도록 주의해 주세요.</em><br>외부로부터 고객님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.
		  </div>
		</form>
		</section>
	</div>
</body>
