<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
  <title>매입한도</title>
</head>

<body>
 
  <div class="section">
    <div class="wrapper">
      <div class="buy-header">
        <h1>마이페이지</h1>
      </div>
      
      <ul class="mypage-tab">
        <li class="list1"><a href="${web_server_url}/myPage/purchaseList.do">매입신청내역</a></li>
        <li class="list2"><a href="${web_server_url}/myPage/accountVerifi.do">계좌인증</a></li>
        <li class="list3 on"><a href="${web_server_url}/myPage/limit.do">매입한도</a></li>
        <li class="list4"><a href="${web_server_url}/myPage/question.do">1:1문의</a></li>
        <li class="list5"><a href="${web_server_url}/myPage/myInfoCheck.do">개인정보수정</a></li>
      </ul>
      <div class="limit-info">
        <p>*매입금액 한도 정책입니다. 완독하시기 바랍니다.</p>
        <ul>
          <li class="one-count">
            <dl>
              <dt>1회</dt>
              <dd class="none">1회최소/최대금액</dd>
              <dd>최소 1만원 이상, <br>최대 500만원 이하</dd>
            </dl>
          </li>
          <li class="one-day">
            <dl>
              <dt>1일</dt>
              <dd class="none">1일 누적 매입한도</dd>
              <dd>최대 10,000,000원</dd>
            </dl>
          </li>
          <li class="one-month">
            <dl>
              <dt>1개월</dt>
              <dd class="none">1개월 누적 매입 한도</dd>
              <dd>최대 20,000,000원</dd>
            </dl>
          </li>
        </ul>
      </div>
    </div>
  </div>
 
</body>
