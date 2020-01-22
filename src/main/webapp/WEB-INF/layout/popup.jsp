<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!Doctype HTML>
<html lang="ko">
<head>
	<meta name="robots" content="noindex, nofollow">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title><sitemesh:write property='title'/></title>	
	<link rel="Shortcut Icon" href="${web_server_url}/images/favicon.ico" />
	<script type="text/javascript" src="${web_server_url}/js/jquery-1.11.2.min.js"></script>
	
	<script type="text/javascript" src="${web_server_url}/js/utils.js"></script>
	
	<sitemesh:write property="head" />

</head>
<body>
	<sitemesh:write property="body" />
	<div id="ajax_load_indicator"></div>
</body>
</html>