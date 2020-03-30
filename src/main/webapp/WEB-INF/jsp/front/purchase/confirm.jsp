<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				url: '/purchase/complete.json',
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
			url: '/purchase/confirmDeposit.json',
			type: 'post',
			data: $("#frm").serialize() ,
			success : function(data) {
				if(data.result){
					$("#laoding-spinner").hide();
					$("#revcCode").val(data.revcCode);
					$("#frm").attr('action', '/purchase/confirmDeposit.do');
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
  <!--section-->
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
      	 	
	  <div class="section">
	    <div class="section-main apply01 apply02">
	      <h2>상품권 매입신청</h2>
	      <ul class="apply-order">
	        <li class="step">
	          <img src="${web_server_url}/images/front/step06.png" alt="매입신청 순서 이미지1">
	          <p>
	            <strong>STEP 01</strong>
	            <br>매입신청
	          </p>
	        </li>
	        <li><img src="${web_server_url}/images/front/bracket.png" alt="꺽쇠 이미지"></li>
	        <li class="step">
	          <img src="${web_server_url}/images/front/step07.png" alt="매입신청 순서 이미지2">
	          <p>
	            <strong>STEP 02</strong>
	            <br>요청확인
	          </p>
	        </li>
	        <li><img src="${web_server_url}/images/front/bracket.png" alt="꺽쇠 이미지"></li>
	        <li class="step">
	          <img src="${web_server_url}/images/front/step08.png" alt="매입신청 순서 이미지3">
	          <p>
	            <strong>STEP 03</strong>
	            <br>입금완료
	          </p>
	        </li>
	      </ul>
	      <div class="matters-text">
	        <div class="matters-img">
	          <img src="${web_server_url}/images/front/speaker.png" alt="확성기 이미지">
	        </div>
	        <div>
	          <h4>매입신청 전 필독사항</h4>
	          <ol>
	            <li>소유하고 있는 상품권의 핀보호만 입력하시면 인증된 계좌로 바로 즉시 송금됩니다.</li>
	            <li>24시간 자동화 운영입니다. 매일 은행망 점검 시간을 제외한 언제, 어디서든 매입 신청이 가능합니다.</li>
	            <li>현재는 컬처랜드에서 발행하는 아래 상품권만 매입이 가능합니다. (문화상품권 / 온라인문화상품권 / 모바일문화상품권-16자리)</li>
	            <li>매입수수료는 <c:out value="${charge}"/>% 입니다. 매입 수수료를 나머지 금액을 입금해드립니다.</li>
	            <li>입금관련 문제시 고객센터 1:1문의 또는 dream@factoress.com 으로 문의해주시기 바랍니다. </li>
	          </ol>
	        </div>
	      </div>
	
	      <h3>매입 신청내역확인</h3>
	      <p class="ref"> * 매입신청 확인 후 "매입 신청하기"를 클릭하셔야 매입이 완료됩니다.</p>
	      <table class="check">
	        <tr>
	          <td>상품권 종류</td>
	          <td>금액</td>
	          <td>매수</td>
	          <td>매입가능여부</td>
	        </tr>
	        <c:forEach items="${purList}" var="list" varStatus="status">
		        <tr>
		          <td>
		          	<c:choose>
		          		<c:when test="${param.giftGubun eq 'W' }">온라인 문화상품권</c:when>
		          		<c:otherwise>모바일 문화상품권</c:otherwise>
		          	</c:choose>
		          </td>
		          <td class="no-center"><fmt:formatNumber value="${list.REQ_MONEY }" pattern="#,###" /> 원</td>
		          <td>1매</td>
		          <td <c:if test="${list.SUCCESS_YN eq 'N' }">class="no-buy"</c:if>>
		          	<c:choose>
		          		<c:when test="${list.SUCCESS_YN eq 'Y' }">매입가능</c:when>
		          		<c:otherwise>매입불가 (<c:out value="${list.FIN_NUMBER }" />)</c:otherwise>
		          	</c:choose>
		          	
		          </td>
		        </tr>
	        </c:forEach>
	      </table>
	      <p class="ntic">* 매입불가 핀코드: 이미 사용이 완료되었거나, 올바르지 않은 형식의 핀코드, 또는 오프라인전용 상품권(편의점 상품권)인 경우, 매입이 불가능합니다.</p>
	      <table class="amount">
	        <tr>
	          <td>총금액</td>
	          <td>성공매수</td>
	          <td>수수료(<c:out value="${buyResult.CHARGE_PER }" />%)</td>
	          <td>매입가</td>
	        </tr>
	        <tr>
	          <td><fmt:formatNumber value="${buyResult.TOTAL_REQ_MONEY }" pattern="#,###" />원</td>
	          <td><fmt:formatNumber value="${buyResult.TOTAL_CNT }" pattern="#,###" />매</td>
	          <td class="no-center"><fmt:formatNumber value="${buyResult.CHARGE_MONEY }" pattern="#,###" />원</td>
	          <td class="no-center"><fmt:formatNumber value="${buyResult.TOTAL_PUR_MONEY }" pattern="#,###" /> 원</td>
	        </tr>
	      </table>
	      <table class="bank">
	        <tr>
	          <td>입금은행</td>
	          <td>계좌번호</td>
	          <td>입금액</td>
	          <td>매입예정</td>
	        </tr>
	        <tr>
	          <td><c:out value="${param.bankName }" /></td>
	          <td><c:out value="${param.accountNo }" /></td>
	          <td class="no-center"><fmt:formatNumber value="${buyResult.TOTAL_PUR_MONEY }" pattern="#,###" />원</td>
	          <td>즉시</td>
	        </tr>
	      </table>
	      <div class="request">
	        <div class="single-btn">
<!-- 	          <a href="/"><button class="reset" type="reset">취소</button></a> -->
	          <a href="javascript:go_complete();"><button type="button" class="request">매입요청하기</button></a>
	        </div>
	      </div>
<!-- 	      <div class="check-btn"> -->
<!-- 	        <div> -->
<!-- 	          <a href="javascript:go_complete();"><button type="button">매입요청하기</button></a> -->
<!-- 	        </div> -->
<!-- 	      </div> -->
	    </div>
	  </div>
  </form>
</body>

