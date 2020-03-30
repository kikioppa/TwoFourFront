<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>    
<head>
  <title>매입신청 STEP02</title>
  <script>
    function check(e) {
      var dama = e.childNodes[0]
      if (dama.src.match("ck-icon2")) {
        dama.src = "${web_server_url}/images/front/ck-icon.png";
      } else {
        dama.src = "${web_server_url}/images/front/ck-icon2.png";
      }
    }
    
    function go_complete(){
    	if($("#totalPurMoney").val() <= 0){
    		alert('매입 요청할 금액이 없습니다.');
    		return;
    	}
    	if(confirm("매입신청을 하시겠습니까?")){
    		$("#laoding-spinner").show();
    		$.ajax({
				url: '/m/purchase/complete.json',
				type: 'post',
				data: $("#frm").serialize() ,
				success : function(data) {
					if(data.result){
						$("#ksNetSeq").val(data.applyMap.seqNo);
						$("#reqDate").val(data.applyMap.reqDate);
						$("#reqTime").val(data.applyMap.reqTime);
						
						setTimeout(function() {
							confirmDeposit();
						}, 3000);
						
					}else{
						alert('실패 하였습니다.');
					}
				}    		
 			})
    	}
    }
    
    function  confirmDeposit(){
    	$.ajax({
			url: '/m/purchase/confirmDeposit.json',
			type: 'post',
			data: $("#frm").serialize() ,
			success : function(data) {
				if(data.result){
					$("#laoding-spinner").hide();
					$("#revcCode").val(data.revcCode);
					$("#frm").attr('action', '/m/purchase/confirmDeposit.do');
					$("#frm").submit();
				}else{
					confirmDeposit();
				}
			}    		
		})
    }
  </script>
</head>

<body>
	<div class="container apply">
		<section class="important-notice">
			<div class="indicater">
				<ol>
					<li><span class="circle">1</span></li>
					<li><span class="circle on">2</span></li>
					<li><span class="circle">3</span></li>
				</ol>
			</div>
		</section>
		<form name="frm" id="frm" method="post">
		<input type="hidden" name="buySeq" id="buySeq" value="<c:out value='${buySeq}' />" />
		<input type="hidden" name="totalPurMoney" id="totalPurMoney" value="<c:out value='${buyResult.TOTAL_PUR_MONEY}' />" />
		<input type="hidden" name="finCodeArr" id="finCodeArr" value="<c:out value='${finCodeArr}'/>" />
	  	<input type="hidden" name="accountNo" id="accountNo" value="<c:out value="${param.accountNo}"/>"/>
	 	<input type="hidden" name="bankCode" id="bankCode" value="<c:out value="${param.bankCode}" />"/>
	   	<input type="hidden" name="bankName" id="bankName" value="<c:out value="${param.bankName}" />"/>
	    <input type="hidden" name="ksNetSeq" id="ksNetSeq" value="" />
	  	<input type="hidden" name="reqDate" id="reqDate" value="" />
	  	<input type="hidden" name="reqTime" id="reqTime" value="" />
	  	<input type="hidden" name="revcCode" id="revcCode" value="" />
		
		<section class="order-confirm">
			<h2>매입 신청내역 확인</h2>
			<div class="topper">
				&#42;매입신청 확인 후 <em>"매입 신청하기"를 클릭하셔야 매입이 완료</em>됩니다.
			</div>
			<div class="order-list">
				<ul>
	        		<c:forEach items="${purList}" var="list" varStatus="status">				
					<li class="item">
						<ul>
							<li>
								<dl>
									<dt>상품권 종류</dt>
									<dd><c:out value="${param.giftGubun eq 'W' ? '온라인 문화상품권':'모바일 문화상품권'}"/></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>금액</dt>
									<dd><fmt:formatNumber value="${list.REQ_MONEY }" pattern="#,###" />원</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>매수</dt>
									<dd>1매</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>매입가능여부</dt>
									<dd>
							          	<c:choose>
							          		<c:when test="${list.SUCCESS_YN eq 'Y' }">매입가능</c:when>
							          		<c:otherwise><span class="primary">매입불가 (<c:out value="${list.FIN_NUMBER }" />)</span></c:otherwise>
							          	</c:choose>
									</dd>
								</dl>
							</li>
						</ul>
					</li>
					</c:forEach>
				</ul>
			</div>
			<div class="bottom">
			  &#42;매입불가 핀코드 : 이미 사용이 완료되었거나, 올바르지 않은 형식의 핀코드, 또는 오프라인전용 상품권(편의점 상품권)인 경우, 매입이 불가능합니다.
			</div>
			<div class="order-list-total">
				<ul>
					<li class="item">
						<ul>
							<li>
								<dl>
								<dt>총금액</dt>
								<dd><fmt:formatNumber value="${buyResult.TOTAL_REQ_MONEY }" pattern="#,###" />원</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>매수</dt>
									<dd><fmt:formatNumber value="${buyResult.TOTAL_CNT }" pattern="#,###" />매</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>수수료(<c:out value="${buyResult.CHARGE_PER }" />%)</dt>
									<dd><fmt:formatNumber value="${buyResult.CHARGE_MONEY }" pattern="#,###" />원</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>매입가</dt>
									<dd><fmt:formatNumber value="${buyResult.TOTAL_PUR_MONEY }" pattern="#,###" />원</dd>
								</dl>
							</li>
						</ul>
					</li>
					<li class="item">
						<ul>
							<li>
								<dl>
									<dt>입금은행</dt>
									<dd><c:out value="${param.bankName }" /></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>계좌번호</dt>
									<dd><c:out value="${(param.accountNo) }" /></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>임금액</dt>
									<dd><fmt:formatNumber value="${buyResult.TOTAL_PUR_MONEY }" pattern="#,###" /> 원</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>매입예정</dt>
									<dd>즉시</dd>
								</dl>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</section>
		</form>

		<section class="submit-btn">
			<a href="javascript:go_complete();" class="btn primary lg square">매입신청하기</a>
		</section>
	</div>

</body>

