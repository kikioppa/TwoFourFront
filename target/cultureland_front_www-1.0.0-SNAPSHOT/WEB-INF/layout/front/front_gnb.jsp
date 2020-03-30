<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="topWrap">
	<header>
	 <!--header-->
		<div class="header">
		  <div class="wrapper">
		    <div class="left">
		      <h1 id="json_logo">
		<%--           <a href="/"><img src="${web_server_url}/images/front/header-logo.png" alt="로고"></a> --%>
		      </h1>
		    </div>
		    <div class="logo">
		      <a href="/">
		        <span> <img class="aaa" src="${web_server_url}/images/front/header-text-logo.png" alt="텍스트로고"></span>
		      </a>
		    </div>
		    <div class="right">
		      <ul>
		      <c:choose>
		      	<c:when test="${not empty user }">
		       	  <li>
		            <a href="${web_server_url}/myPage/purchaseList.do">
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
		            <a href="${web_server_url}/member/join.do">
		              <span class="join"></span>
		              <div>
		                <span>회원가입</span>
		              </div>
		            </a>
		          </li>
		          <li>
		            <a href="${web_server_url}/member/login.do">
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
		    <li class="li-header"><a href="${web_server_url}/point/view.do">문상1번가특징</a>
		    </li>
		    <li class="li-header"><a href="${web_server_url}/purchase/apply.do">상품권매입신청</a>
		    </li>
		    <li class="li-header"><a href="${web_server_url}/board/notice/list.do">고객센터</a>
		    </li>
		  </ul>
		  <c:if test="${menu_id eq '03' }">
		  <div class="gnb-2depth">
		    <ul>
		      <li <c:if test="${sub_menu_id eq '33' }">class="on"</c:if>><a href="${web_server_url}/board/notice/list.do">공지사항</a></li>
		      <li <c:if test="${sub_menu_id eq '31' }">class="on"</c:if>><a href="${web_server_url}/board/FAQ/list.do">FAQ</a></li>
		      <li <c:if test="${sub_menu_id eq '32' }">class="on"</c:if>><a href="${web_server_url}/board/inquiry/write.do">1:1 문의</a></li>
		    </ul>
		  </div>
		  </c:if>
		</div>
	</header>
</div>