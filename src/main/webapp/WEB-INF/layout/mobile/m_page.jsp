<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!Doctype HTML>
<html lang="ko">
<head>
    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
	<link rel="Shortcut Icon" href="${mobile_nomal_url}/images/favicon.ico" />
	<title><sitemesh:write property='title'/></title>
	
	<meta name="title" content="SPC 컬리너리 아카데미" />
<meta name="Description" content="SPC컬리너리아카데미는 SPC 그룹 파리크라상이 운영하는 제과,제빵,요리,커피,와인 분야의 전문 교육기관입니다."  />
<meta name="keywords" content="SPC, SPC컬리너리, SPC컬리너리아카데미, 파티세리 클래스, 프랑스정통빵, INBP제빵, SCA에듀케이션, 에꼴 르노뜨르 요리, 에꼴 르노뜨르 제과, ASI, 르 소믈리에 비긴즈" />
<meta property="og:title" content="SPC 컬리너리 아카데미" /> 
<meta property="og:type" content="website" />
<meta property="og:description" content="SPC컬리너리아카데미는 SPC 그룹 파리크라상이 운영하는 제과,제빵,요리,커피,와인 분야의 전문 교육기관입니다." />
<meta property="og:image" content="${mobile_server_url}/images/app_icon_1200_627.jpg" />


	<link rel="stylesheet" type="text/css" href="${mobile_server_url}/css/style_m.css" />
	<link rel="stylesheet" type="text/css" href="${mobile_server_url}/css/jquery.bxslider.css" />
	<script type="text/javascript" src="${mobile_server_url}/js/front/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${mobile_server_url}/js/front/front_m.js"></script>
	<script type="text/javascript" src="${mobile_server_url}/js/front/jquery.bxslider.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/clipboard.js/1.5.3/clipboard.min.js" ></script>

	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<!--[if lt IE 9]>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
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
<body>

	<!-- gnb -->
	<%@ include file="/WEB-INF/layout/mobile/m_gnb.jsp" %>
	<!-- //gnb -->

	<!-- body -->
	<sitemesh:write property="body" />
	<!--// body -->

	<div id="ajax_load_indicator"></div>


	<!-- footer -->
    <%@ include file="/WEB-INF/layout/mobile/m_footer.jsp" %>
    <!-- //footer -->

</body>
</html>
