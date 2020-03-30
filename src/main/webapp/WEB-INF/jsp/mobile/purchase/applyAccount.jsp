<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<head>
	<title>계좌인증</title>
	<script>
		function account_cert(){
			if ( isValid() && confirm("인증요청하시겠습니까?")){
				$("#laoding-spinner").show();
				$.ajax({
					url: '/m/purchase/applyAccount.json',
					type: 'post',
					data: $("#apiForm").serialize() ,
					success : function(data) {
						if(data.result == "success"){
							$("#ksNetSeq").val(data.applyMap.seqNo);
							$("#reqDate").val(data.applyMap.reqDate);
							$("#reqTime").val(data.applyMap.reqTime);
						
							
							setTimeout(function() {
								applyAccountRecv();
							}, 3000);
						}else{
							alert('실패 하였습니다.');
						}
					}    		
	 			})		
			}
		}
		
		function applyAccountRecv(){
			$.ajax({
				url: '/m/purchase/applyAccountRecv.json',
				type: 'post',
				async: false,
				dataType: 'json',
				data: $("#apiForm").serialize() ,
				success : function(data) {
					if(data.result){
						$("#laoding-spinner").hide();
						alert('인증에 성공하였습니다.');
						$("#bankName").val($("#bankCode option:checked").text());
						$("#apiForm").attr('action', '/m/purchase/apply.do');
						$("#apiForm").submit();
					}else{
						applyAccountRecv();
					}
				}    		
			})	
		}
		function isValid(){
			var returnStr = true;

			
			if(  returnStr  &&  trimNvl( $("#bankCode").val() )){
				alert('은행을 선택해 주십시요.');
				$('#bankCode').focus();
				returnStr = false;
			}	
			
			if(  returnStr && trimNvl( $("#accountNo").val())){
				alert('계좌번호를 입력해 주십시요.');
				$('#accountNo').focus();
				returnStr = false;
			}

			return returnStr;	
		}
		
	</script>
</head>

<body>
	<div class="container account">
      <form id="apiForm" name="apiForm" method="post">
      	<input type="hidden" name="ksNetSeq" id="ksNetSeq" value="" />
      	<input type="hidden" name="reqDate" id="reqDate" value="" />
      	<input type="hidden" name="reqTime" id="reqTime" value="" />
      	<input type="hidden" name="bankName" id="bankName" value="" />
		<section class="account-form">
			<div class="select-wrap">
	            <select id="bankCode" name="bankCode">
	            	<option value="">선택하세요</option>
					<c:forEach items="${bankList}" var="list">
						<option value="${list.CODE_VAL}" ><c:out value="${list.CODE_NAME }"/></option>
					</c:forEach>		
	            </select>
			</div>
			<div class="input-text-wrap underline-type">
				<input type="text" id="memberName" name="memberName" type="text" value="<c:out value="${user.name}"/>" placeholder="이름">
			</div>
			<div class="input-text-wrap underline-type">
				<input type="number" id="accountNo" name="accountNo" maxlength="20" value="" placeholder='계좌번호 "-" 제외한 번호입력'>
			</div>
			<div class="btn-wrap">
				<ul class="multi">
					<li>
						<a href="#" onclick="account_cert();" class="btn primary lg square">인증요청</a>
					</li>
				</ul>
			</div>
		</section>
		</form>
	</div>

</body>
