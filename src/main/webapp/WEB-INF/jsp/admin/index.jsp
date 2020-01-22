<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<html>
<head>
<title>메인 화면</title>
<script>
$(function(){
	
	var indexUrl = $(".header").find("a").eq(1).attr("href");
	if ( typeof(indexUrl ) !="undefined" ) {
		window.location.href = indexUrl;
	}
});

</script>
</head>
<body>

	<div class="contWarp">
		<div class="contents noTab">
		</div>
	</div>
	
</body>