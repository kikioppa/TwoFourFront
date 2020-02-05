<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="Shortcut Icon" href="${web_ssl_url}/images/favicon.ico" />
	<title>문상1번가 </title>
	  
	<link rel="stylesheet" href="${web_ssl_url}/css/mobile/style_m.css">
	<link rel="stylesheet" href="${web_ssl_url}/css/mobile/owl.carousel.css">
	<!-- mainbanner -->
	<link rel="stylesheet" href="${web_ssl_url}/css/mobile/owl.theme.default.css">
	<!-- mainbanner -->
	<script src="${web_ssl_url}/js/mobile/jquery.min.js"></script>
	<script src="${web_ssl_url}/js/mobile/script_m.js"></script>
	<script src="${web_ssl_url}/js/mobile/owl.carousel.js"></script>
	<!-- mainbanner -->
	<script>
	
	</script>
	
</head>

<body>
	<!-- gnb -->
	<%-- <%@ include file="/WEB-INF/layout/mobile/m_gnb.jsp" %> --%>
	<div class="pulldown-menu slide-up">
		<div class="header">
			<div class="prefix">
				<ul>
					<c:if test="${empty user }">
					<li>
					    <a href="javascript:console.log('회원가입');">
					      <span class="icon">
					        <object type="image/svg+xml" data="/svg/icon-join.svg"></object>
					      </span> 회원가입
					    </a>
					</li>
					<li>
					    <a href="javascript:console.log('로그인');">
					      <span class="icon">
					        <object type="image/svg+xml" data="/svg/icon-login-in-pullmenu.svg"></object>
					      </span> 로그인
					    </a>
					</li>
					</c:if>
					<c:if test="${not empty user }">
					<li>
					    <a href="javascript:console.log('마이페이지');">
					      <span class="icon">
					        <object type="image/svg+xml" data="/svg/icon-join.svg"></object>
					      </span> 마이페이지
					    </a>
					</li>					
					<li>
					    <a href="javascript:console.log('로그아웃');">
					      <span class="icon">
					        <object type="image/svg+xml" data="/svg/icon-login-in-pullmenu.svg"></object>
					      </span> 로그아웃
					    </a>
					</li>
					</c:if>
				</ul>
			</div>
			<div class="title"></div>
	
			<div class="suffix">
				<a href="javascript:console.log('close');" class="btn-close">
					<span class="icon">
						<svg 
						  xmlns="http://www.w3.org/2000/svg"
						  xmlns:xlink="http://www.w3.org/1999/xlink"
						  viewBox="0 0 33 34"
						  width="17" height="16.5">
						  <path fill-rule="evenodd"  fill="rgb(255, 255, 255)"
						  d="M34.008,30.582 L32.632,31.999 L17.518,17.391 L1.696,32.718 L0.304,31.282 L16.079,16.000 L0.992,1.418 L2.368,0.000 L17.498,14.625 L32.304,0.282 L33.696,1.718 L18.937,16.016 L34.008,30.582 Z"/>
						</svg>
					</span>
				</a>
			</div>
		</div>
		<div class="accordion-list">
			<ul>
				<li><a href="" onclick="location.href='${web_ssl_url}/m/point/view.do'">문상1번가 특징</a></li>
				<li><a href="">상품권 매입신청</a></li>
					<li class="has-child">
					<a href="" onclick="slideDownChild(this);">
					<span class="title">고객센터</span>
						<span class="icon">
							<svg 
							  xmlns="http://www.w3.org/2000/svg"
							  xmlns:xlink="http://www.w3.org/1999/xlink"
							  viewBox="0 0 29 15"
							  width="14.5" height="7.5">
							<path fill-rule="evenodd"  fill="rgb(223, 0, 0)"
							  d="M14.496,12.712 L1.659,0.272 C1.277,-0.099 0.663,-0.099 0.281,0.272 C-0.102,0.643 -0.102,1.238 0.281,1.609 L13.810,14.722 C14.193,15.093 14.806,15.093 15.189,14.722 L28.711,1.609 C28.899,1.427 29.000,1.182 29.000,0.944 C29.000,0.706 28.906,0.461 28.711,0.279 C28.329,-0.092 27.715,-0.092 27.333,0.279 L14.496,12.712 Z"/>
							</svg>
						</span>
					</a>
				</li>
				<li class="child">
					<ul class="depth-02">
						<li><a href="" onclick="location.href='${web_ssl_url}/m/board/notice/list.do'">공지사항</a></li>
						<li><a href="" onclick="location.href='${web_ssl_url}/m/board/FAQ/list.do'">FAQ</a></li>
						<li><a href="" onclick="location.href='${web_ssl_url}/m/board/inquiry/write.do'">1:1 문의</a></li>
					</ul>
				</li>
				<li class="has-child">
					<a href="" onclick="slideDownChild(this);">
					<span class="title">마이페이지</span>
						<span class="icon">
							<svg 
							   xmlns="http://www.w3.org/2000/svg"
							   xmlns:xlink="http://www.w3.org/1999/xlink"
							   viewBox="0 0 29 15"
							   width="14.5" height="7.5">
							 <path fill-rule="evenodd"  fill="rgb(223, 0, 0)"
							   d="M14.496,12.712 L1.659,0.272 C1.277,-0.099 0.663,-0.099 0.281,0.272 C-0.102,0.643 -0.102,1.238 0.281,1.609 L13.810,14.722 C14.193,15.093 14.806,15.093 15.189,14.722 L28.711,1.609 C28.899,1.427 29.000,1.182 29.000,0.944 C29.000,0.706 28.906,0.461 28.711,0.279 C28.329,-0.092 27.715,-0.092 27.333,0.279 L14.496,12.712 Z"/>
							</svg>
						</span>
					</a>
				</li>
				<li class="child">
					<ul class="depth-02">
						<li><a href="" onclick="location.href='${web_ssl_url}/m/myPage/purchaseList.do'">매입신청 내역</a></li>
						<li><a href="" onclick="location.href='${web_ssl_url}/m/myPage/account.do'">계좌인증</a></li>
						<li><a href="" onclick="location.href='${web_ssl_url}/m/myPage/limit.do'">매입한도</a></li>
						<li><a href="" onclick="location.href='${web_ssl_url}/m/myPage/myInfo.do'">개인정보수정</a></li>
					</ul>
				</li>
			</ul>
			<div class="bottom-fix">
				<ul>
					<li class="kakao"><a href=""><span class="icon-kakao"></span> 카카오톡 상담</a></li>
					<li class="naver"><a href=""><span class="icon-naver"></span> 네이버 톡톡 상담</a></li>
				</ul>
	    	</div>
		</div>
	</div>
	
	<nav class="has-shadow">
		<div class="header">
			<div class="prefix">
				<a href="" class="hamberger-menu">
			      	<span class="icon-menu"></span>
				</a>
			</div>
			<div class="title">
				<h1><a href="/"><img src="${web_ssl_url}/images/mobile/logo.png" alt="logo"></a></h1>
			</div>
		
			<div class="suffix"></div>
		</div>
		<div class="quickmenu">
			<ul>
				<li><a href="${web_ssl_url}/m/point/view.do">문상1번가특징</a></li>
				<li><a href="${web_ssl_url}/m/purchase/apply.do">상품권 매입신청</a></li>
				<li><a href="${web_ssl_url}/m/board/notice/list.do">고객센터</a></li>
			</ul>
		</div>
	</nav>	
	<!-- //gnb -->


	<div class="container main wedge">

		<section class="main-banner">
			<div class="banner owl-carousel owl-theme">
		    	<div class="card">
					<a href="javascript:alert('banner1');">
			        <img src="${web_ssl_url}/images/mobile/main_banner_01.png" alt="">
					</a>
				</div>
				<div class="card">
					<a href="javascript:alert('banner2');">
					<img src="${web_ssl_url}/images/mobile/main_banner_02.png" alt="">
					</a>
		  		</div>
			</div>
		
			<div class="float-btn">
				<a href="javascript:alert('float-btn');">
			    <img src="${web_ssl_url}/images/mobile/float_btn.png" alt="">
			    </a>
			</div>
		</section>

		<section class="realtime-board">
			<div class="h2">
		    	<img src="${web_ssl_url}/images/mobile/realtime_board_title.png" alt="실시간초스피드! 입금처리현황">
			</div>
			<!-- <h2>실시간초스피드! 입금처리현황</h2> -->
			<div>
				<ul>
					<li>
						<ul>
							<li class="date">[11.19]</li>
							<li class="name">홍길동</li>
							<li class="cost">250,000</li>
							<li class="time">15:12:14</li>
							<li class="late">11초</li>
							<li class="result"><span class="tag dark">입금완료</span></li>
						</ul>
					</li>
					<li>
						<ul>
							<li class="date">[11.19]</li>
							<li class="name">홍길동</li>
							<li class="cost">250,000</li>
							<li class="time">15:12:14</li>
							<li class="late">11초</li>
							<li class="result"><span class="tag dark">입금완료</span></li>
						</ul>
					</li>
					<li>
						<ul>
							<li class="date">[11.19]</li>
							<li class="name">홍길동</li>
							<li class="cost">250,000</li>
							<li class="time">15:12:14</li>
							<li class="late">11초</li>
							<li class="result"><span class="tag dark">입금완료</span></li>
						</ul>
					</li>
					<li>
						<ul>
							<li class="date">[11.19]</li>
							<li class="name">홍길동</li>
							<li class="cost">250,000</li>
							<li class="time">15:12:14</li>
							<li class="late">11초</li>
							<li class="result"><span class="tag dark">입금완료</span></li>
						</ul>
					</li>
					<li>
						<ul>
							<li class="date">[11.19]</li>
							<li class="name">홍길동</li>
							<li class="cost">250,000</li>
							<li class="time">15:12:14</li>
							<li class="late">11초</li>
							<li class="result"><span class="tag dark">입금완료</span></li>
						</ul>
					</li>
					<li>
						<ul>
							<li class="date">[11.19]</li>
							<li class="name">홍길동</li>
							<li class="cost">250,000</li>
							<li class="time">15:12:14</li>
							<li class="late">11초</li>
							<li class="result"><span class="tag dark">입금완료</span></li>
						</ul>
					</li>
				</ul>
			</div>
		</section>

		<section class="sub-banner veryfast">
			<a href="">
				<div class="banner yellow-bg">
					<img src="${web_ssl_url}/images/mobile/sub_banner_veryfast.png" alt="현금입금신청하기">
				</div>
			</a>
		</section>

		<section class="cs-links">
			<ul>
				<li>
					<a href="${web_ssl_url}/m/board/notice/list.do">
						<div class="prefix">
							<span class="icon-notice"></span>
						</div>
						<div class="title">공지사항</div>
						<div class="suffix">
							<span class="icon-arrow"></span>
						</div>
					</a>
       			</li>
				<li>
					<a href="${web_ssl_url}/m/board/FAQ/list.do">
						<div class="prefix">
							<span class="icon-faq"></span>
						</div>
						<div class="title">FAQ자주묻는질문</div>
						<div class="suffix">
							<span class="icon-arrow"></span>
						</div>
					</a>
				</li>
			</ul>
		</section>

		<section class="calculator">
			<div class="h2">
				<div class="prefix">
					<span class="icon-calculator"></span>
				</div>
				<div class="title">수수료계산기</div>
			</div>
			<div class="calc-input">
				<div class="input-text-wrap">
					<input type="number">
				</div>
				<div class="unit">
					<a href="" class="btn text sm">계산</a>
				</div>
			</div>
			<div class="calc-output">
				<ul>
					<li>
						<ul>
							<li><span class="title">상품권 합계금액</span></li>
							<li><span class="value">100,000원</span></li>
						</ul>
					</li>
					<li>
						<ul>
							<li><span class="title">매입수수료율</span></li>
							<li><span class="value">13.0%</span></li>
						</ul>
					</li>
					<li>
						<ul>
							<li><span class="title">매입수수료 금액</span></li>
							<li><span class="value">100,000원</span></li>
						</ul>
					</li>
				</ul>
				<div class="total-value">
					<ul>
						<li><span class="title">입금예정 금액</span></li>
						<li><span class="value">880,000</span>원</li>
					</ul>
				</div>
			</div>
		</section>

		<section class="sub-banner veryfast">
			<a href="">
				<div class="banner red-bg">
					<img src="${web_ssl_url}/images/mobile/sub_banner_veryfast_02.png" alt="현금입금신청하기">
				</div>
			</a>
		</section>
		<!-- footer -->
	    <%@ include file="/WEB-INF/layout/mobile/m_footer.jsp" %>
	    <!-- //footer -->

	</div>

	<!-- bottom gnb -->
    <%@ include file="/WEB-INF/layout/mobile/m_bottom.jsp" %>
    <!-- //bottom gnb -->

	<script>
	    //mainbanner
		$(document).ready(function() {
			// 메인배너 init
			$(".main-banner > .banner").owlCarousel({
		        stagePadding: 30,
		        margin: 20,
		        items: 1,
		        loop: false,
		        dots: false,
		        responsive: {
		          600: {
		            items: 2,
		          },
		        }
			});
		});
	</script>


</body>

</html>