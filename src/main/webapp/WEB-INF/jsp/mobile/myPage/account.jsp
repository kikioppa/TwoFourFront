<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<head>
	<title>계좌인증</title>
	<script>
		function account_cert(){
			if ( isValid() && confirm("인증요청하시겠습니까?")){
				$.ajax({
					url: '/front/openbank/getAccountCert.json',
					type: 'post',
					data: $("#apiForm").serialize() ,
					success : function(data) {
						if(data.success){
							alert('성공하였습니다.');
						}else{
							alert('실패 하였습니다.');
						}
					},    		
	 			})	
			}
		}
		function isValid(){
			var returnStr = true;

			
			if(  returnStr  &&  trimNvl( $("#bank_code").val() )){
				alert('은행을 선택해 주십시요.');
				$('#bank_code').focus();
				returnStr = false;
			}	
			
			if(  returnStr && trimNvl( $("#acnt_number").val())){
				alert('계좌번호를 입력해 주십시요.');
				$('#acnt_number').focus();
				returnStr = false;
			}

			return returnStr;	
		}
	</script>
</head>

<body>
	<div class="container account">
      <form id="apiForm">
      	<input type="hidden" id="seq" name="seq" value="<c:out value="${detail.SEQ}"/>"/>
		<section class="account-form">
			<div class="select-wrap">
	            <select id="bank_code" name="bank_code">
	            	<option value="">선택하세요</option>
					<c:forEach items="${bankList}" var="list">
						<option value="${list.CODE_VAL}" <c:if test="${detail.BANK_CODE eq list.CODE_VAL}">selected="selected"</c:if>  ><c:out value="${list.CODE_NAME }"/></option>
					</c:forEach>	
	            </select>
			</div>
			<div class="input-text-wrap underline-type">
				<input type="text" id="member_name" name="member_name" type="text" readonly="readonly" value="<c:out value="${user.name}"/>" placeholder="이름">
			</div>
			<div class="input-text-wrap underline-type">
				<input type="number" id="acnt_number" name="acnt_number" maxlength="20" value="<c:out value="${ndn:seedDecoding(detail.ACNT_NUMBER)}" />" placeholder='계좌번호 "-" 제외한 번호입력'>
			</div>
			<div class="btn-wrap">
				<ul class="multi">
					<li>
					<a href="" onclick="account_cert();" class="btn primary lg square"><c:out value="${empty detail ? '인증요청':'계좌변경'}"/></a>
					</li>
				</ul>
			</div>
		</section>
		</form>
	</div>

</body>
