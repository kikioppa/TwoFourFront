<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/ndn.tld" prefix="ndn" %>
<!Doctype HTML>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0" />
	<meta name="format-detection" content="telephone=no" />
	<link rel="Shortcut Icon" href="${web_server_url}/images/favicon.ico" />
	<title>문상1번가 - <sitemesh:write property='title'/></title>	
	<link rel="stylesheet" href="${web_server_url}/css/front/daterangepicker.css">
	<link rel="stylesheet" href="${web_server_url}/css/front/style.css">
	<link rel="stylesheet" href="${web_server_url}/css/front/jquery-ui.css">
	<script src="${web_server_url}/js/front/jquery-1.12.4.min.js"></script>
	<script src="${web_server_url}/js/front/jquery.min.js"></script>
	<script src="${web_server_url}/js/front/jquery-ui.min.js"></script>
	<script src="${web_server_url}/js/front/list.js"></script>
	<script src="${web_server_url}/js/front/gnb.js"></script>
	<script src="${web_server_url}/js/front/wordchk_search.js"></script>
	<script src="${web_server_url}/js/front/utils.js"></script>
	<script src="${web_server_url}/js/front/script.js"></script>
	<script src="${web_server_url}/js/front/moment.js"></script>
	<script src="${web_server_url}/js/front/daterangepicker.js"></script>
	<script type="text/javascript" src="${web_server_url}/js/front/jquery.form.js"></script>
	<script type="text/javascript" src="${web_server_url}/js/front/core.min.js"></script>
	<script type="text/javascript" src="${web_server_url}/js/front/sha256.min.js"></script>  
	<script type="text/javascript" src="${web_server_url}/js/front/layout.js"></script>  
	<!--[if lt IE 9]>
	<script type="text/javascript" src="${web_server_url}/js/modernizr.js"></script>
	<![endif]-->
	
	<sitemesh:write property="head" />
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-114364901-1"></script>
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
	  
		jQuery(document).ready(function() {
			jQuery.ajax({
				type : "post",
				url: "/logo.json",
				success : function(data) {
		            var htmlCode = '<a href="/"><img src="${web_server_url}' + '/upload' + data.file_stre_cours + data.stre_file_nm + '" alt="로고"></a>';
		                
		            $('#json_logo').append(htmlCode);
				},
				error: function(request, status, err) {
					//alert('서버와의 통신이 실패했습니다.');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+err);
				}
			});
		});	  
		
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());
	
		gtag('config', 'UA-114364901-1');
	  
		function fn_logout(){
			if(confirm('로그아웃 하시겠습니까?')){
				window.location.href='/member/logout.do';
			}
		}
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
        <a href="${web_server_url}/purchase/apply.do">
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
            <p>02-2203-3305</p>
          </div>
        </a>
      </li>
      <li class="kakao">
        <a id="channel-chat-button"  href="#" onclick="void chatChannel();">
          <span class="kakao-img"></span>
          <div>
            <p>카톡상담</p>
            <p>moonsang1</p>
          </div>
        </a>
      </li>
      <!-- 
      <li class="naver">
        <a href="#">
          <span class="naver-img"></span>
          <div>
            <p>네이버 톡톡</p>
            <p>채팅상담</p>
          </div>
        </a>
      </li>
       -->
    </ul>
  </div>
  <div class="laoding-spinner" id="laoding-spinner" style="display:none;">
    <div class="spinner-border" role="status"></div>
  </div>
</body>
</html>