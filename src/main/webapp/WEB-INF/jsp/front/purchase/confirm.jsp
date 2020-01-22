<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>문화 1번가 - 매입신청 STEP02</title>
  <script>
    function check(e) {
      var dama = e.childNodes[0]
      if (dama.src.match("ck-icon2")) {
        dama.src = "${web_server_url}/images/front/ck-icon.png";
      } else {
        dama.src = "${web_server_url}/images/front/ck-icon2.png";
      }
    }
  </script>
</head>

<body>
  <!--section-->
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
            <li>매입수수료는 13.0% 입니다. 매입 수수료를 나머지 금액을 입금해드립니다.</li>
            <li>입금관련 문제시 고객센터 1:1문의 또는 help@xxx.xxx 으로 문의해주시기 바랍니다. </li>
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
        <tr>
          <td>컬처랜드 문화상품권</td>
          <td class="no-center">500,000 원</td>
          <td>10매</td>
          <td class="no-buy">매입불가 (3121-5525-5555-456654)</td>
        </tr>
        <tr>
          <td>컬처랜드 문화상품권</td>
          <td class="no-center">0 원</td>
          <td>1매</td>
          <td>매입가능</td>
        </tr>
        <tr>
          <td>컬처랜드 문화상품권</td>
          <td class="no-center">0 원</td>
          <td>1매</td>
          <td class="no-buy">매입불가 (3121-5525-5555-456654)</td>
        </tr>
      </table>
      <p class="ntic">* 매입불가 핀코드: 이미 사용이 완료되었거나, 올바르지 않은 형식의 핀코드, 또는 오프라인전용 상품권(편의점 상품권)인 경우, 매입이 불가능합니다.</p>
      <table class="amount">
        <tr>
          <td>총금액</td>
          <td>매수</td>
          <td>수수료(13%)</td>
          <td>매입가</td>
        </tr>
        <tr>
          <td>500,000 원</td>
          <td>10 매</td>
          <td class="no-center">65,000 원</td>
          <td class="no-center">435,000 원</td>
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
          <td>국민은행</td>
          <td>54321-01-12345</td>
          <td class="no-center">435,000 원</td>
          <td>즉시</td>
        </tr>
      </table>
      <div class="request">
        <div>
          <a href="/"><button class="reset" type="reset">취소</button></a>
          <a href="/purchase/complete.do"><button class="request">매입요청하기</button></a>
        </div>
      </div>
    </div>
  </div>
</body>

</html>