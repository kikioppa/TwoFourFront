<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib uri="/WEB-INF/tld/ndn.tld" prefix="ndn" %> --%>
<script>
function fn_logout(){
	if(confirm('로그아웃 하시겠습니까?')){
		window.location.href='/front/member/logout.do';
	}
}
</script>
<div class="topWrap">
<header>
				 <!--header-->
  <div class="header">
    <div class="wrapper">
      <div class="left">
        <h1>
          <a href="/"><img src="${web_server_url}/images/front/header-logo.png" alt="로고"></a>
        </h1>
      </div>
      <div class="logo">
        <a href="/">
          <span> <img class="aaa"src="${web_server_url}/images/front/header-text-logo.png" alt="텍스트로고"></span>
        </a>
      </div>
      <div class="right">
        <ul>
        <c:choose>
        	<c:when test="${not empty user }">
	        	  <li>
		            <a href="${web_server_url}/front/myPage/list.do">
		              <span class="mypage"></span>
		              <div>
		                <span>마이페이지</span>
		              </div>
		            </a>
		          </li>
		          <li>
		            <a href="javascript:fn_logout();">
		              <span class="logout"></span>
		              <div>
		                <span>로그아웃</span>
		              </div>
		            </a>
		          </li>
        	</c:when>
        	<c:otherwise>
        		<li>
		            <a href="${web_server_url}/front/member/join.do">
		              <span class="join"></span>
		              <div>
		                <span>회원가입</span>
		              </div>
		            </a>
		          </li>
		          <li>
		            <a href="${web_server_url}/front/member/login.do">
		              <span class="login"></span>
		              <div>
		                <span>로그인</span>
		              </div>
		            </a>
		          </li>
        	</c:otherwise>
        </c:choose>
          
          
        </ul>
      </div>
    </div>
  </div>
  <!--nav-->
  <div class="nav">
    <ul class="gnb">
      <li class="li-header"><a href="/point/view.do">문상1번가특징</a>
      </li>
      <li class="li-header"><a href="/purchase/apply.do">상품권매입신청</a>
        <ul>
          <li><a href="/front/myPage/list.do">매입신청내역</a></li>
          <li><a href="/front/myPage/account.do">계좌인증</a></li>
          <li><a href="/front/myPage/limit.do">매입한도</a></li>
          <li><a href="/front/myPage/myInfo.do">개인정보수정</a></li>
        </ul>
      </li>
      <li class="li-header"><a href="/board/notice/list.do">고객센터</a>
        <ul>
          <li><a href="/board/notice/list.do">공지사항</a></li>
          <li><a href="/board/FAQ/list.do">FAQ</a></li>
          <li><a href="/board/inquiry/write.do">1:1 문의</a></li>
        </ul>
      </li>
    </ul>
  </div>
			</header>
</div>
