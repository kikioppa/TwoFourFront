<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>메인</title>

<link rel="stylesheet" href="${web_server_url}/js/front/owl.carousel/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${web_server_url}/js/front/owl.carousel/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${web_server_url}/css/front/style.css">
  <!-- Javascript -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="${web_server_url}/js/front/owl.carousel/owl.carousel.js"></script>
  <script src="${web_server_url}/js/front/script.js"></script>
  
<script>
    $(document).ready(function() {
      var owl = $('.main-banner');
      owl.owlCarousel({
        items: 1,
        loop: true,
        margin: 0,
        nav: true,
        dot: true,
        dotsClass: "main-dot",
        autoplay: true,
        autoplayTimeout: 5000,
        autoplayHoverPause: true
      });

    })
  </script>
</head>
<body>
<div class="slide-section">
    <div class="main-banner owl-carousel owl-theme">
      <div class="item">
        <a href="#">
          <div class="slide-img">content</div>
        </a>
      </div>
      <div class="item">
        <a href="#">
          <div class="slide-img2">content</div>
        </a>
      </div>
    </div>
  </div>
  <div class="section sectionbg">
    <div class="wrapper">
      <div class="speed-list">
        <span class="list-header"><img src="${web_server_url}/images/front/list-header.png" alt="실시간초스피드"></span>
        <ul class="list-top">
          <li>[MM.dd]</li>
          <li>홍*동</li>
          <li>250,000</li>
          <li>15:12:14</li>
          <li>11초</li>
          <li>입금완료</li>
        </ul>
        <ul>
          <li>[MM.dd]</li>
          <li>홍*동</li>
          <li>250,000</li>
          <li>15:12:14</li>
          <li>11초</li>
          <li>입금완료</li>
        </ul>
        <ul>
          <li>[MM.dd]</li>
          <li>홍*동</li>
          <li>250,000</li>
          <li>15:12:14</li>
          <li>11초</li>
          <li>입금완료</li>
        </ul>
        <ul>
          <li>[MM.dd]</li>
          <li>홍*동</li>
          <li>250,000</li>
          <li>15:12:14</li>
          <li>11초</li>
          <li>입금완료</li>
        </ul>
        <ul>
          <li>[MM.dd]</li>
          <li>홍*동</li>
          <li>250,000</li>
          <li>15:12:14</li>
          <li>11초</li>
          <li>입금완료</li>
        </ul>
        <ul>
          <li>[MM.dd]</li>
          <li>홍*동</li>
          <li>250,000</li>
          <li>15:12:14</li>
          <li>11초</li>
          <li>입금완료</li>
        </ul>
        <ul class="last-list">
          <li>[MM.dd]</li>
          <li>홍*동</li>
          <li>250,000</li>
          <li>15:12:14</li>
          <li>11초</li>
          <li>입금완료</li>
        </ul>
      </div>
      <div class="demo-video">
        <h3>상품권매입 요청 데모영상</h3>
        <div class="video">
          <iframe width="573" height="410" src="https://www.youtube.com/embed/ZOQJe0DmO5o" frameborder="0" allow="accelerometer; autoplay=1; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
      </div>
    </div>
  </div>
  <div class="section buy-list">
    <a href="#">
      <div class="coin-bg"></div>
    </a>
    <div class="step-list">
      <div class="wrapper">
        <h2><span>상품권 매입</span> 신청순서</h2>
        <ul class="frist-list">
          <li class="frist-list-1">STEP 01</li>
          <li class="frist-list-2">STEP 02</li>
          <li class="frist-list-3">STEP 03</li>
          <li class="frist-list-4">STEP 04</li>
          <li class="frist-list-5">STEP 05</li>
        </ul>
        <div class="circle-list">
          <ul>
            <li>
              <div class="circle-list-1">
                <span class="out-circle"></span>
                <span class="in-circle"></span>
              </div>
            </li>
            <li>
              <div class="circle-list-2">
                <span class="out-circle"></span>
                <span class="in-circle"></span>
              </div>
            </li>
            <li>
              <div class="circle-list-3">
                <span class="out-circle"></span>
                <span class="in-circle"></span>
              </div>
            </li>
            <li>
              <div class="circle-list-4">
                <span class="out-circle"></span>
                <span class="in-circle"></span>
              </div>
            </li>
            <li>
              <div class="circle-list-5">
                <span class="out-circle"></span>
                <span class="in-circle"></span>
              </div>
            </li>
          </ul>
        </div>
        <div class="step-info">
          <ul>
            <li class="st1"><span class="step-01"></span>
              <div class="step-head">
                <span>회원가입</span>
              </div>
              <div class="step-text">
                <span>필요한 정보만~!</span>
              </div>
            </li>
            <li class="st2"><span class="step-02"></span>
              <div class="step-head">
                <span>로그인</span>
              </div>
              <div class="step-text">
                <span>아이디/비번 찾기도<br> 아주 편리하게~!</span>
              </div>
            </li>
            <li class="st3"><span class="step-03"></span>
              <div class="step-head">
                <span>본인계좌인증</span>
              </div>
              <div class="step-text">
                <span>은행명/계좌번호/<br>예금주만 입력하면 끝~!</span>
              </div>
            </li>
            <li class="st4"><span class="step-04"></span>
              <div class="step-head">
                <span>매입신청하기</span>
              </div>
              <div class="step-text">
                <span>핀번호 입력하기<br> 대용량 핀번호도 가능~!</span>
              </div>
            </li>
            <li class="st5"><span class="step-05"></span>
              <div class="step-head">
                <span>입금완료</span>
              </div>
              <div class="step-text">
                <span>20초 이내 입금완료~!</span>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <div class="line"></div>
    </div>
  </div>
  <div class="section notice">
    <div class="notice-list fis-list">
      <div class="notice-header">
        <span class="not-pg on">공지사항</span>
        <span class="faq">FAQ</span>
        <a href="#">+MORE</a>
      </div>
      <div class="not-list">
        <ul>
          <li class="dot new"><a href="#">[공지] 24콘 매입수수료 변경안내입니다.24콘 매입수수료 안내합니다asdfasdfasdf</a></li>
          <li>2019.12.31</li>
        </ul>
        <ul>
          <li class="dot new"><a href="#">24콘 사이트 이용시 유희사항입니다.</a></li>
          <li>2019.12.31</li>
        </ul>
        <ul>
          <li class="dot new"><a href="#">서비스 정기점검 안내입니다 정기점검 안내입니다</a></li>
          <li>2019.12.31</li>
        </ul>
        <ul>
          <li class="dot"><a href="#">24콘 사이트 이용시 유희사항입니다.</a></li>
          <li>2019.12.31</li>
        </ul>
        <ul>
          <li class="dot"><a href="#">24콘 사이트 이용시 유희사항입니다.</a></li>
          <li>2019.12.31</li>
        </ul>
        <ul>
          <li class="dot"><a href="#">24콘 사이트 이용시 유희사항입니다.</a></li>
          <li>2019.12.31</li>
        </ul>
      </div>
    </div>
    <div class="notice-list sec-list">
      <div class="notice-header">
        <span class="not-pg ">공지사항</span>
        <span class="faq on">FAQ</span>
        <a href="#">+MORE</a>
      </div>
      <div class="not-list">
        <ul>
          <li class="dot"><a href="#">회원 가입은 무료인가요 ??</a></li>
          <li>2019.12.31</li>
        </ul>
        <ul>
          <li class="dot"><a href="#">24콘 사이트 이용시 유희사항입니다.</a></li>
          <li>2019.12.31</li>
        </ul>
        <ul>
          <li class="dot"><a href="#">24콘 사이트 이용시 유희사항입니다.</a></li>
          <li>2019.12.31</li>
        </ul>
        <ul>
          <li class="dot"><a href="#">24콘 사이트 이용시 유희사항입니다.</a></li>
          <li>2019.12.31</li>
        </ul>
        <ul>
          <li class="dot"><a href="#">24콘 사이트 이용시 유희사항입니다.</a></li>
          <li>2019.12.31</li>
        </ul>
      </div>
    </div>
    <div class="calc">
      <div class="calc-bg">수수료 계산기</div>
      <div class="enter-date">
        <input type="text">
        <span>원</span>
        <button>계산하기</button>
      </div>
      <div class="date-info">
        <ul class="frist-date">
          <li>상품권 합계금액</li>
          <li>100,000원</li>
        </ul>
        <ul>
          <li>매입수수료율</li>
          <li> 13.0%</li>
        </ul>
        <ul>
          <li>매입수수료 금액</li>
          <li>13,000원</li>
        </ul>
        <ul class="final-sum">
          <li>입금예정 금액</li>
          <li><span>87,100</span>원</li>
        </ul>
      </div>
    </div>
    <div class="cash-button">
      <a href="#">초스피드 실시간 20초~!!<span>현금입금 신청하기</span></a>
    </div>
  </div>
</body>
</html>