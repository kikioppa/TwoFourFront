<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<head>
	<title>계좌인증</title>
	<script>
	function account_cert(){
		if ( isValid() && confirm("인증요청하시겠습니까?")){
			$("#laoding-spinner").show();
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
							applyAccountRecv();
						}, 3000);
					}else{
						alert('실패 하였습니다.');
					}
				}    		
 			})		
		}
	}

	var delayCnt = 0;
		function applyAccountRecv(){
		$.ajax({
				url: '/purchase/applyAccountRecv.json',
				type: 'post',
				async: false,
				dataType: "json",
				timeout : 3000,
				data: $("#apiForm").serialize(),
				success : function(data) {
					if(data.result == "delay"){
						if(delayCnt < 3){
							delayCnt = delayCnt + 1;
							setTimeout(function() {
						 		applyAccountRecv();
							}, 3000);
						}else{
							delayCnt = 0;
							alert('통신의 문제가 발생했습니다.\n 잠시후 다시 시도해 주세요.');
							$("#laoding-spinner").hide();
							return;
						}
					}else{
						if(data.result){
							$("#laoding-spinner").hide();
							alert('인증에 성공하였습니다.');
							delayCnt = 0;
							$("#bankName").val($("#bankCode option:checked").text());
							$("#apiForm").attr('action', '/purchase/apply.do');
							$("#apiForm").submit();
						}else{
							alert('입력한 정보를 확인 후 다시 인증하세요.');
							$("#laoding-spinner").hide();
							return;
						}
					}
					
				}
			});	
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
