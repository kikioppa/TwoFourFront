<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<script>
<c:if test="${ not empty javaScript.message }">
alert("${javaScript.message}")
</c:if>
<c:if test="${not empty javaScript.methods }">
	<c:forEach items="${javaScript.methods}" var="script">
	${script.value};
	</c:forEach>
</c:if>
<c:if test="${ not empty javaScript.location }">
location.href='${javaScript.location}';
</c:if>
</script>
