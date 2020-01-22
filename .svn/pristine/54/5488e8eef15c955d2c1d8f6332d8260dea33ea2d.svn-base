<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib uri="/WEB-INF/tld/ndn.tld" prefix="ndn" %> --%>
<script>


</script>
<nav class="skipNav">
		<a href="#content">본문 바로가기</a>
		<a href="#gnb">하단메뉴 바로가기</a>
	</nav>
	<header <c:if test="${menu_id eq 'main'}">style="background: #000;"</c:if> >
		<h1><a href="${mobile_server_url}/m/index.do"><img src="${mobile_server_url}/images/mobile/common/logo.png" alt="SPC CULINARY ACADEMY" /></a></h1>
		<span class="btns">
<%-- 			<a href="#"><img src="${mobile_server_url}/images/mobile/common/btn_fb.gif" alt="페이스북" /></a> --%>
<%-- 			<a href="#"><img src="${mobile_server_url}/images/mobile/common/btn_insta.gif" alt="인스타그램" /></a> --%>
			<button class="btnMenu">메뉴</button>
		</span>
		<nav id="gnb">
			<div <c:if test="${menu_id eq '01'}">class="open hover"</c:if>><!-- 선택시 hover 현재 열린 페이지는 open 추가 -->
				<a href="javascript:void(0);">아카데미</a>
				<div class="depth2">
					<ul>
						<li><a href="${mobile_server_url}/m/academy/intro.do" <c:if test="${menu_id eq '01' && sub_menu_id eq '01'}">class="selected"</c:if>>아카데미소개</a></li><!-- 선택시 selected 추가 -->
						<li><a href="${mobile_server_url}/m/academy/hello.do" <c:if test="${menu_id eq '01' && sub_menu_id eq '02'}">class="selected"</c:if>>원장인사말</a></li>
						<li><a href="${mobile_server_url}/m/academy/instructors.do" <c:if test="${menu_id eq '01' && sub_menu_id eq '03'}">class="selected"</c:if>>강사소개</a></li>
						<li><a href="${mobile_server_url}/m/academy/findWaySin.do" <c:if test="${menu_id eq '01' && sub_menu_id eq '04'}">class="selected"</c:if>>찾아오시는 길</a></li>
					</ul>
				</div>
			</div>
			<div <c:if test="${menu_id eq '02'}">class="open hover"</c:if>>
				<a href="javascript:void(0);">정규과정</a>
				<div class="depth2">
					<a href="${mobile_server_url}/m/regular/franBaking.do">제빵과정</a>
					<ul>
						<li><a href="${mobile_server_url}/m/regular/franBaking.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '01'}">class="selected"</c:if>>프랑스 정통빵 마스터 클래스</a></li>
						<li><a href="${mobile_server_url}/m/regular/inbpBaking.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '02'}">class="selected"</c:if>>INBP 제빵 마스터 클래스</a></li>
					</ul>
					<a href="${mobile_server_url}/m/regular/confectionery.do">제과과정</a>
					<ul>
						<li><a href="${mobile_server_url}/m/regular/confectionery.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '03'}">class="selected"</c:if>>에꼴 르노뜨르 제과 마스터 클래스</a></li>
						<li><a href="${mobile_server_url}/m/regular/partySserie.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '04'}">class="selected"</c:if>>파티세리 클래스</a></li>
					</ul>
					<a href="${mobile_server_url}/m/regular/homemade.do">요리과정</a>
					<ul>
						<li><a href="${mobile_server_url}/m/regular/homemade.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '11'}">class="selected"</c:if>>홈메이드 유러피안 쿠킹클래스</a></li>
						<li><a href="${mobile_server_url}/m/regular/cookingPro.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '12'}">class="selected"</c:if>>쿠킹클래스 전문가 과정</a></li>
						<li><a href="${mobile_server_url}/m/regular/cooking.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '05'}">class="selected"</c:if>>에꼴 르노뜨르 요리 마스터 클래스</a></li>
					</ul>
					<a href="${mobile_server_url}/m/regular/scaBuildup.do">커피과정</a>
					<ul>
						<li><a href="${mobile_server_url}/m/regular/scaBuildup.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '13'}">class="selected"</c:if>>SCA 커피 빌드업 (SCA 자격증 취득과정)</a></li>
						<li><a href="${mobile_server_url}/m/regular/coffee.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '06'}">class="selected"</c:if>>SCA 커피 에듀케이션 프로그램</a></li>
						<li><a href="${mobile_server_url}/m/regular/cafeBeverage.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '14'}">class="selected"</c:if>>카페 베버리지 마스터</a></li>
						<li><a href="${mobile_server_url}/m/regular/qGrader.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '15'}">class="selected"</c:if>>큐그레이더</a></li>
					</ul>
					<a href="${mobile_server_url}/m/regular/asiWine.do">와인과정</a>
					<ul>
						<li><a href="${mobile_server_url}/m/regular/asiWine.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '07'}">class="selected"</c:if>>A.S.I 소믈리에 디플로마</a></li>
						<li><a href="${mobile_server_url}/m/regular/beginWine.do" <c:if test="${menu_id eq '02' && sub_menu_id eq '08'}">class="selected"</c:if>>르 소믈리에 비긴즈</a></li>
					</ul>
				</div>
			</div>
			<div <c:choose><c:when test="${menu_id eq '03'}">class="open"</c:when><c:otherwise>class="none"</c:otherwise></c:choose>  >
				<a href="${mobile_server_url}/m/etcCourse/shortCourse.do?progYn=Y">단기과정</a>
			</div>
			<div <c:choose><c:when test="${menu_id eq '04'}">class="open"</c:when><c:otherwise>class="none"</c:otherwise></c:choose>>
				<a href="${mobile_server_url}/m/etcCourse/specialCourse.do">스페셜과정</a>
			</div>
			<div <c:choose><c:when test="${menu_id eq '05'}">class="open"</c:when><c:otherwise>class="none"</c:otherwise></c:choose>>
				<a href="${mobile_server_url}/m/etcCourse/cookingLab.do">쿠킹랩</a>
			</div>
			<div <c:choose><c:when test="${menu_id eq '06'}">class="open"</c:when><c:otherwise>class="none"</c:otherwise></c:choose>>
				<a href="${mobile_server_url}/m/gallery/list.do">갤러리</a>
			</div>
			<div <c:if test="${menu_id eq '07'}">class="open hover"</c:if>>
				<a href="javascript:void(0)">커뮤니티</a>
				<div class="depth2">
					<ul>
						<li><a href="${mobile_server_url}/m/board/list.do" <c:if test="${menu_id eq '07' && sub_menu_id eq '01'}">class="selected"</c:if>>공지사항</a></li>
						<li><a href="${mobile_server_url}/m/board/faqList.do" <c:if test="${menu_id eq '07' && sub_menu_id eq '02'}">class="selected"</c:if>>자주하는 질문</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
