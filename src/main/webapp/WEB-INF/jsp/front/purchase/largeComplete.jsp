<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>    
<head>
  <title>문화 1번가 - 대용량 매입신청 STEP02</title>
  <script>
    function check(e) {
      var dama = e.childNodes[0]
      if (dama.src.match("ck-icon2")) {
        dama.src = "${web_server_url}/images/front/ck-icon.png";
      } else {
        dama.src = "${web_server_url}/images/front/ck-icon2.png";
      }
    }
    
    function go_main(){
   		$("#frm").attr('action','/index.do');
   		$("#frm").submit();
    }
    
  </script>
</head>

<body>
  <!--section-->
  <form name="frm" id="frm" method="post">
  	<input type="hidden" name="buySeq" id="buySeq" value="<c:out value='${buySeq}' />" />
  	<input type="hidden" name="totalPurMoney" id="totalPurMoney" value="<c:out value='${buyResult.TOTAL_PUR_MONEY}' />" />
	  <div class="section">
	    <div class="section-main apply01 apply02 apply03">
	      <h2>대용량 상품권 매입신청</h2>
	      <h3>대용량 매입신청완료 내역</h3>
	      <table>
	        <tr>
	          <td>상품권 종류</td>
	          <td>금액</td>
	          <td>매수</td>
	          <td>매입가능여부</td>
	        </tr>
	        <tr>
	          <td>컬처랜드 문화상품권</td>
	          <td><fmt:formatNumber value="${buyResult.TOTAL_REQ_MONEY }" pattern="#,###" /> 원</td>
	          <td><fmt:formatNumber value="${buyResult.TOTAL_CNT }" pattern="#,###" />매</td>
	          <td>매입가능</td>
	        </tr>
	        <c:forEach items="${purList}" var="list" varStatus="status">
	        	<tr>
		          <td>컬처랜드 문화상품권</td>
		          <td><fmt:formatNumber value="${list.REQ_MONEY }" pattern="#,###" /> 원</td>
		          <td>1매</td>
		          <td class="no-buy">
		          	매입불가<br />
		          	(<c:out value="${list.FIN_NUMBER }" />)
		          </td>
		        </tr>
	        </c:forEach>
	      </table>
	      <table class="amount">
	        <tr>
	          <td>총금액</td>
	          <td>매수</td>
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
	          <td><c:out value="${param.accountNo}" /></td>
	          <td class="no-center"><fmt:formatNumber value="${buyResult.TOTAL_PUR_MONEY }" pattern="#,###" />원</td>
	          <td>유선으로 확인 후 입금</td>
	        </tr>
	      </table>
	      <div class="check-btn">
	        <div>
	          <button type="button" onclick="go_main()">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
  </form>
</body>
