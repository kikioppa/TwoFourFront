<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<head>
	<title>계좌인증</title>
	<script>
		function account_cert(){
			if ( isValid() && confirm("인증요청하시겠습니까?")){
				$.ajax({
					url: '/purchase/applyAccount.json',
					type: 'post',
					data: $("#apiForm").serialize() ,
					success : function(data) {
						if(data.result == "success"){
							$("#ksNetSeq").val(data.applyMap.seqNo);
							$("#reqDate").val(data.applyMap.reqDate);
							$("#reqTime").val(data.applyMap.reqTime);
							setTimeout(function() {
								$.ajax({
									url: '/purchase/applyAccount2.json',
									type: 'post',
									async: false,
									dataType: 'json',
									data: $("#apiForm").serialize() ,
									success : function(data) {
										if(data.result){
											alert('인증에 성공하였습니다.');
											$("#bankName").val($("#bankCode option:checked").text());
											$("#apiForm").attr('action', '/purchase/apply.do');
											$("#apiForm").submit();
										}else{
											alert('실패 하였습니다.');
										}
									},    		
					 			})	
							}, 3000);
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
  <div class="section">
    <div class="wrapper">
      <div class="buy-header">
        <h1>계좌인증</h1>
      </div>
      
      <div class="certify-info">
      <form id="apiForm" name="apiForm" method="post">
      	<input type="hidden" name="ksNetSeq" id="ksNetSeq" value="" />
      	<input type="hidden" name="reqDate" id="reqDate" value="" />
      	<input type="hidden" name="reqTime" id="reqTime" value="" />
      	<input type="hidden" name="bankName" id="bankName" value="" />
        <table>
          <colgroup>
            <col style="width: 100px;">
          </colgroup>
          <tr>
            <td>은행형</td>
            <td>
            <select id="bankCode" name="bankCode">
            	<option value="">선택하세요</option>
				<c:forEach items="${bankList}" var="list">
					<option value="${list.CODE_VAL}" ><c:out value="${list.CODE_NAME }"/></option>
				</c:forEach>	
            </select>
            </td>
          </tr>
          <tr>
            <td>예금주</td>
            <td><input id="memberName" name="memberName" type="text"  value="<c:out value="${user.name}"/>"/> </td><!--  readonly="readonly" -->
          </tr>
          <tr>
            <td>계좌번호</td>
            <td><input id="accountNo" name="accountNo" type="text" numberonly="true" onkeypress="isNUM()" maxlength="20" value=""/></td>
          </tr>
        </table>
        <div class="certify-btn">
			<button type="button" onclick="account_cert();"  >인증요청</button>
        </div>
        </form>
      </div>
    </div>
  </div>
</body>
