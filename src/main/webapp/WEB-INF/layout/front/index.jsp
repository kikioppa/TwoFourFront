<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!Doctype HTML>
<html lang="ko">
<head>
	<link rel="canonical" href="https://www.spcculinary.co.kr">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<link rel="Shortcut Icon" href="${web_server_url}/images/favicon.ico" />
	<title><sitemesh:write property='title'/></title>
<meta name="title" content="SPC 컬리너리 아카데미" />
<meta name="Description" content="SPC컬리너리아카데미는 SPC 그룹 파리크라상이 운영하는 제과,제빵,요리,커피,와인 분야의 전문 교육기관입니다."  />
<meta name="keywords" content="SPC, SPC컬리너리, SPC컬리너리아카데미, 파티세리 클래스, 프랑스정통빵, INBP제빵, SCA에듀케이션, 에꼴 르노뜨르 요리, 에꼴 르노뜨르 제과, ASI, 르 소믈리에 비긴즈" />
<meta property="og:title" content="SPC 컬리너리 아카데미" /> 
<meta property="og:type" content="website" />
<meta property="og:description" content="SPC컬리너리아카데미는 SPC 그룹 파리크라상이 운영하는 제과,제빵,요리,커피,와인 분야의 전문 교육기관입니다." />
<meta property="og:image" content="${web_server_url}/images/app_icon_1200_627.jpg" />
<link rel="stylesheet" type="text/css" href="${web_server_url}/css/style.css?v=20181227" />
<link rel="stylesheet" type="text/css" href="${web_server_url}/css/jquery.fullPage.css" />

<script type="text/javascript" src="${web_server_url}/js/front/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${web_server_url}/js/front/html5shiv.min.js"></script>
<script type="text/javascript" src="${web_server_url}/js/front/front.js"></script>
<script type="text/javascript" src="${web_server_url}/js/front/jquery-ui.min.js"></script>
<script type="text/javascript" src="${web_server_url}/js/front/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="${web_server_url}/js/front/scrolloverflow.js"></script>
<script type="text/javascript" src="${web_server_url}/js/front/jquery.fullPage.js"></script>
<script type="text/javascript" src="${web_server_url}/js/front/examples.js"></script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/clipboard.js/1.5.3/clipboard.min.js" ></script>

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
	
	<!-- //gnb -->

	<!-- body -->
	<sitemesh:write property="body" />
	<!--// body -->

<!-- 	<div id="ajax_load_indicator"></div> -->


<!-- 	footer -->
<%--     <%@ include file="/WEB-INF/layout/front/front_footer.jsp" %> --%>
<!--     //footer -->
<div id="quick">
		<a href="${web_server_url}/board/list.do" target="_blank"><img src="${web_server_url}/images/common/btn_quick01.png" alt="공지사항" /></a>
<%-- 		<a href="#"><img src="${web_server_url}/images/common/btn_quick02.png" alt="입학신청" /></a> --%>
		<a href="${web_server_url}/upload/file/regularPlan.pdf" target="_blank"><img src="${web_server_url}/images/common/btn_quick03.png" alt="커리큘럼" /></a>
		<span class="btn_quick_tel">
			<ul>
				<li><span>TEL. </span> 02-6331-3535</li>
				<li><span>E-mail. </span> spcacademy1@spc.co.kr</li>
			</ul>
			<img src="${web_server_url}/images/common/btn_quick_tel.png" alt="연락처" />
		</span>
		<a href="${web_server_url}/academy/findWaySin.do"><img src="${web_server_url}/images/common/btn_quick04.png" alt="찾아오시는 길" /></a>
		<a href="https://www.facebook.com/spcculinaryacademy" target="_blank"><img src="${web_server_url}/images/common/btn_quick05.png" alt="페이스북" /></a>
		<a href="https://www.instagram.com/spcculinaryacademy/" target="_blank"><img src="${web_server_url}/images/common/btn_quick06.png" alt="인스타그램" /></a>
		<a href="#firstPage" class="btnGoTopMain btnGoTop"><img src="${web_server_url}/images/common/btn_quick_top.png" alt="TOP" /></a>
	</div>

</body>
</html>
