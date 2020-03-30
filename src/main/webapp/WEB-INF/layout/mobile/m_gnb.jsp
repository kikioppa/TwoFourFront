<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib uri="/WEB-INF/tld/ndn.tld" prefix="ndn" %> --%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	//<![CDATA[
	  // 사용할 앱의 JavaScript 키를 설정해 주세요.
	  Kakao.init('09dc3663142424a0a814ae954f7e5372');
	  // 스토리 공유 버튼을 생성합니다.
	  function chatChannel() {
	      Kakao.Channel.chat({
	          channelPublicId: '_xoxgTxlxb'
	      });
	  }
	//]]>
</script>

	<div class="pulldown-menu slide-up">
		<div class="header">
			<div class="prefix">
				<ul>
					<c:if test="${empty user }">
					<li>
					    <a href="javascript:void(0)" onclick="location.href='${web_ssl_url}/m/member/join.do'">
					      <span class="icon">
					        <object type="image/svg+xml" data="/svg/icon-join.svg"></object>
					      </span> 회원가입
					    </a>
					</li>
					<li>
					    <a href="javascript:void(0)" onclick="location.href='${web_ssl_url}/m/member/login.do'">
					      <span class="icon">
					        <object type="image/svg+xml" data="/svg/icon-login-in-pullmenu.svg"></object>
					      </span> 로그인
					    </a>
					</li>
					</c:if>
					<c:if test="${not empty user }">
					<li>
					    <a href="javascript:void(0)" onclick="location.href='${web_ssl_url}/m/myPage/purchaseList.do'">
					      <span class="icon">
					        <object type="image/svg+xml" data="/svg/icon-join.svg"></object>
					      </span> 마이페이지
					    </a>
					</li>					
					<li>
					    <a href="javascript:void(0)" onclick="location.href='${web_ssl_url}/m/member/logout.do'">
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
				<li><a href="" onclick="location.href='${web_ssl_url}/m/purchase/applyAccount.do'">상품권 매입신청</a></li>
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
<%-- 						<li><a href="" onclick="location.href='${web_ssl_url}/m/myPage/accountVerifi.do'">계좌인증</a></li> --%>
						<li><a href="" onclick="location.href='${web_ssl_url}/m/myPage/limit.do'">매입한도</a></li>
						<li><a href="" onclick="location.href='${web_ssl_url}/m/myPage/question.do'">1:1문의내역</a></li>
						<li><a href="" onclick="location.href='${web_ssl_url}/m/myPage/myInfoCheck.do'">개인정보수정</a></li>
					</ul>
				</li>
			</ul>
			<div class="bottom-fix">
				<ul>
					<li class="kakao"><a id="channel-chat-button"  href="#" onclick="void chatChannel();"><span class="icon-kakao"></span> 카카오톡 상담</a></li>
					<!-- 
					<li class="naver"><a href=""><span class="icon-naver"></span> 네이버 톡톡 상담</a></li>
	    			-->
				</ul>
	    	</div>
		</div>
	</div>
	
	<nav class="has-border sub">
		<div class="header">
			<div class="prefix">
		    	<a href="javascript:history.back();" class="icon">
					<!-- 뒤로가기icon -->
					<svg 
					  xmlns="http://www.w3.org/2000/svg"
					  xmlns:xlink="http://www.w3.org/1999/xlink"
					  viewBox="0 0 18 35"
					  width="9" height="17.5">
					  <path fill-rule="evenodd"  fill="rgb(51, 51, 51)"
					  d="M2.335,17.500 L17.716,1.695 C18.094,1.306 18.094,0.683 17.716,0.294 C17.338,-0.095 16.731,-0.095 16.353,0.294 L0.287,16.803 C-0.091,17.192 -0.091,17.816 0.287,18.204 L16.353,34.706 C16.539,34.897 16.788,35.000 17.031,35.000 C17.274,35.000 17.523,34.905 17.709,34.706 C18.087,34.318 18.087,33.694 17.709,33.306 L2.335,17.500 Z"/>
					</svg>
					<!-- 뒤로가기icon -->
				</a>
			</div>
			<div class="title">
			  <!-- <h1><img src="../img/logo.png" alt="logo"></h1> -->
				<h1>
					<c:choose>
						<c:when test="${menu_id eq '01' && sub_menu_id eq '11'}">문상1번가특징</c:when>
						<c:when test="${menu_id eq '02' && sub_menu_id eq '21'}">상품권 매입신청</c:when>
						<c:when test="${menu_id eq '03' && sub_menu_id eq '31'}">FAQ</c:when>
						<c:when test="${menu_id eq '03' && sub_menu_id eq '32'}">1:1문의</c:when>
						<c:when test="${menu_id eq '03' && sub_menu_id eq '33'}">공지사항</c:when>
						<c:when test="${menu_id eq '04' && sub_menu_id eq '41'}">마이페이지 - 매입신청내역</c:when>
						<c:when test="${menu_id eq '04' && sub_menu_id eq '42'}">마이페이지 - 대용량 매입신청내역</c:when>
						<c:when test="${menu_id eq '04' && sub_menu_id eq '43'}">마이페이지 - 1:1 문의 내역</c:when>
<%-- 						<c:when test="${menu_id eq '04' && sub_menu_id eq '44'}">마이페이지 - 계좌인증</c:when> --%>
						<c:when test="${menu_id eq '04' && sub_menu_id eq '45'}">마이페이지 - 매입한도</c:when>
						<c:when test="${menu_id eq '04' && sub_menu_id eq '46'}">마이페이지 - 개인정보수정</c:when>
					</c:choose>
				</h1>
			</div>
	
			<div class="suffix">
				<a href="" class="hamberger-menu">
					<span class="icon-menu"></span>
				</a>			
			</div>
		</div>
		<div class="quickmenu">
			<ul>
				<li><a href="${web_ssl_url}/m/point/view.do">문상1번가특징</a></li>
				<li><a href="${web_ssl_url}/m/purchase/applyAccount.do">상품권 매입신청</a></li>
				<li><a href="${web_ssl_url}/m/board/notice/list.do">고객센터</a></li>
			</ul>
		</div>
	</nav>
  
<%-- 	<div class="pulldown-menu slide-up">
		<div class="header">
			<div class="prefix">
				<ul>
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
						<li><a href="${web_ssl_url}/m/myPage/purchaseList.do">매입신청 내역</a></li>
						<li><a href="${web_ssl_url}/m/myPage/account.do">계좌인증</a></li>
						<li><a href="${web_ssl_url}/m/myPage/limit.do">매입한도</a></li>
						<li><a href="${web_ssl_url}/m/myPage/myInfo.do">개인정보수정</a></li>
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
	</nav> --%>