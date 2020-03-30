<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>     
<head>
  <title>매입신청 STEP03</title>
</head>

<body>


  <!--section-->
  <div class="section">
    <div class="section-main apply01 apply02 apply03">
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
      <h3>입금완료 내역</h3>
      
       <table>
      
        <tr>
          <td>상품권 종류</td>
          <td>금액</td>
          <td>매수</td>
          <td>매입 성공내역</td>
        </tr>
        <c:forEach items="${purList2}" var="list" varStatus="status">
        <tr>
          <td>
          	<c:choose>
          		<c:when test="${buyResult.giftGubun eq 'W' }">온라인 문화상품권</c:when>
          		<c:otherwise>모바일 문화상품권</c:otherwise>
          	</c:choose>
		  </td>
          <td><fmt:formatNumber value="${list.PURCHASE_MONEY }" pattern="#,###" />원</td>
          <td>1매</td>
          <td>
			<c:choose>
		   		<c:when test="${list.DEPOSIT eq 'Y' }">매입성공</c:when>
		   		<c:otherwise><span style ="color:red;">매입실패</span> </c:otherwise>
		   </c:choose>
		          	
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
          <td><fmt:formatNumber value="${buyResult.CHARGE_MONEY }" pattern="#,###" />원</td>
          <td><fmt:formatNumber value="${buyResult.TOTAL_PUR_MONEY }" pattern="#,###" /> 원</td>
        </tr>
      </table>
      <table class="bank">
        <tr>
          <td>입금은행</td>
          <td>계좌번호</td>
          <td>입금액</td>
        </tr>
        <tr>
          <td><c:out value="${accountInfo.BANK_NAME }" /></td>
          <td><c:out value="${ndn:seedDecoding(accountInfo.ACNT_NUMBER) }" /></td>
          <td><fmt:formatNumber value="${buyResult.TOTAL_PUR_MONEY }" pattern="#,###" /> 원</td>
        </tr>
      </table>
      <div class="check-btn">
        <div>
          <a href="/index.do"><button type="button"">확인</button></a>
        </div>
      </div>
    </div>
  </div>
</body>