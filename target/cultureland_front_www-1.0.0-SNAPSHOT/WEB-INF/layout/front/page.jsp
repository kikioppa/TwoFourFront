<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!Doctype HTML>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<link rel="Shortcut Icon" href="${web_server_url}/images/favicon.ico" />
	<title>문상1번가 - <sitemesh:write property='title'/></title>	
	<link rel="stylesheet" href="${web_server_url}/css/front/style.css">
	  <link rel="stylesheet" href="${web_server_url}/css/front/sub.css">
	  <script src="${web_server_url}/js/front/jquery-1.12.4.min.js"></script>
	  <script src="${web_server_url}/js/front/jquery.min.js"></script>
<!-- 	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
	  <script src="${web_server_url}/js/front/list.js"></script>
	  <script src="${web_server_url}/js/front/gnb.js"></script>
<!-- <meta name="title" content="SPC 컬리너리 아카데미" /> -->
<!-- <meta name="Description" content="SPC컬리너리아카데미는 SPC 그룹 파리크라상이 운영하는 제과,제빵,요리,커피,와인 분야의 전문 교육기관입니다."  /> -->
<!-- <meta name="keywords" content="SPC, SPC컬리너리, SPC컬리너리아카데미, 파티세리 클래스, 프랑스정통빵, INBP제빵, SCA에듀케이션, 에꼴 르노뜨르 요리, 에꼴 르노뜨르 제과, ASI, 르 소믈리에 비긴즈" /> -->
<!-- <meta property="og:title" content="SPC 컬리너리 아카데미" />  -->
<!-- <meta property="og:type" content="website" /> -->
<!-- <meta property="og:description" content="SPC컬리너리아카데미는 SPC 그룹 파리크라상이 운영하는 제과,제빵,요리,커피,와인 분야의 전문 교육기관입니다." /> -->
<%-- <meta property="og:image" content="${web_server_url}/images/app_icon_1200_627.jpg" /> --%>
	
<%-- 	<link rel="stylesheet" type="text/css" href="${web_server_url}/css/style.css" /> --%>
<%-- 	<link rel="stylesheet" type="text/css" href="${web_server_url}/css/grid_component.css" /> --%>
	
<%-- 	<script type="text/javascript" src="${web_server_url}/js/front/jquery-1.11.2.min.js"></script> --%>
<%-- 	<script type="text/javascript" src="${web_server_url}/js/front/html5shiv.min.js"></script> --%>
<%-- 	<script type="text/javascript" src="${web_server_url}/js/front/front.js"></script> --%>
<%-- 	<script type="text/javascript" src="${web_server_url}/js/front/masonry.pkgd.js"></script> --%>
<%-- 	<script type="text/javascript" src="${web_server_url}/js/front/jquery.dotdotdot.min.js"></script> --%>
<!-- 	<script type="text/javascript" src="https://cdn.jsdelivr.net/clipboard.js/1.5.3/clipboard.min.js" ></script> -->
	<!--[if lt IE 9]>
	<script type="text/javascript" src="${web_server_url}/js/modernizr.js"></script>
	<![endif]-->
	
	<sitemesh:write property="head" />
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-114364901-1"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'UA-114364901-1');
	</script>
		
</head>
<body id="body">

	<!-- gnb -->
	<%@ include file="/WEB-INF/layout/front/front_gnb.jsp" %>
	<!-- //gnb -->
	
	<!-- body -->
	<sitemesh:write property="body" />
	<!--// body -->
	
	<div id="ajax_load_indicator"></div>
	

	<!-- footer -->
    <%@ include file="/WEB-INF/layout/front/front_footer.jsp" %>
    <!-- //footer -->
    <div class="right-banner">
    <ul>
      <li class="buy-ask">
        <a href="#">
          <span class="coin"></span>
          <div>
            <p>레알 실시간 20초~!</p>
            <p>상품권 매입신청</p>
            <span class="arrow"></span>
          </div>
        </a>
      </li>
      <li class="service">
        <a href="#">
          <span class="service-img"></span>
          <div>
            <p>고객센터</p>
            <p>1234-8654</p>
          </div>
        </a>
      </li>
      <li class="kakao">
        <a href="#">
          <span class="kakao-img"></span>
          <div>
            <p>카톡상담</p>
            <p>moonsang1</p>
          </div>
        </a>
      </li>
      <li class="naver">
        <a href="#">
          <span class="naver-img"></span>
          <div>
            <p>네이버 톡톡</p>
            <p>채팅상담</p>
          </div>
        </a>
      </li>
    </ul>
  </div>
</body>
</html>