<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

<title>Login Demo - Kakao JavaScript SDK</title>
</head>
<body>

 <c:if test="${userId eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=a8374d494ca18ba8e3cd6c0a43756d44&redirect_uri=http://localhost:8092/member/kakaologin.do&response_type=code">
         <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
        </a>
    </c:if>
    <c:if test="${userId ne null}">
    <h1>로그인 성공</h1>
    </c:if>
</body>
</html>
