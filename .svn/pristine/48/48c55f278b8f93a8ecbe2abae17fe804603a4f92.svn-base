<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/ndn.tld" prefix="ndn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<meta name="robots" content="noindex, nofollow">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<link rel="stylesheet" href="${web_server_url}/css/admin-custom.css">
	<link rel="stylesheet" href="${web_server_url}/css/admin.css">
	<link rel="stylesheet" href="${web_server_url}/css/style.css">
	<link rel="stylesheet" href="${web_server_url}/css/board.css">
	<link rel="stylesheet" href="${web_server_url}/css/main.css">
  <link rel="stylesheet" href="${web_server_url}/css/admin-custom.css">
  <!--script-->
  <script src="${web_server_url}/js/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="${web_server_url}/js/jquery.form.js"></script>
  <script src="${web_server_url}/js/script.js"></script>
  <script src="${web_server_url}/js/utils.js"></script>
  <script src="${web_server_url}/js/wordchk_search.js"></script>
	<title>관리자-<sitemesh:write property='title'/></title>
<%-- 	<script type="text/javascript" src="${web_server_url}/js/jquery-1.11.2.min.js"></script> --%>
	
	<script type="text/javascript" src="${web_server_url}/js/jquery.form.js"></script>
	<script type="text/javascript" src="${web_server_url}/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="${web_server_url}/js/jquery.ezmark.min.js"></script>
	<script type="text/javascript" src="${web_server_url}/js/jquery-filestyle.min.js"></script>
	<script type="text/javascript" src="${web_server_url}/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${web_server_url}/js/json2.js"></script>
	<script type="text/javascript" src="${web_server_url}/js/utils.js"></script>
	<script type="text/javascript" src="${web_server_url}/js/multiFile.js"></script>
	<script type="text/javascript" src="${web_server_url}/js/jquery.simple-dtpicker.js"></script>
	<script type="text/javascript" src="${web_server_url}/js/admin.js"></script>
	<sitemesh:write property="head" />
	

	<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
<%-- 	<script type="text/javascript" src="${web_server_url}/js/core.min.js"></script> --%>
<%-- <script type="text/javascript" src="${web_server_url}/js/sha256.min.js"></script> --%>
</head>
	<div class="header sub no-depth header-link ">
    <div class="pc f-wrap">
      <div class="left">
      	<c:set var="adminAuthArr" value="${fn:split(admin.auth, '|')}" />
        <h1><a href="/admin/index.do">상품권매입 사이트 관리자 페이지</a></h1>
        <ul class="menu f-wrap">
        	<c:if test="${adminAuthArr[0] eq '1' }">
	          <li>
	            <a href="/admin/user/list.do">회원관리</a>
	            <!-- 회원관리 -->
					<ul class="depth2">				
						<c:forEach items="${MapValue.authMenu1List}" var="menu">
							<li <c:if test="${sub_menu_id eq menu.key }">class="on"</c:if> ><a class="menu1" href="<c:out value="${MapValue.authMenuUrlCode[menu.key]}"/>"><c:out value="${menu.value }"/></a></li>
						</c:forEach>
							
					</ul>
	          </li>
          	</c:if>
          	<c:if test="${adminAuthArr[1] eq '1' }">
	          <li>
	            <a href="/admin/purchase/list.do">매입처리관리</a>
	            <ul class="depth2">
	              <!-- 매입처리관리 -->
					<c:forEach items="${MapValue.authMenu2List}" var="menu">				
						<li <c:if test="${sub_menu_id eq menu.key }">class="on"</c:if>><a class="menu2" href="<c:out value="${MapValue.authMenuUrlCode[menu.key]}"/>"><c:out value="${menu.value }"/></a></li>
					</c:forEach>
	            </ul>
	          </li>
            </c:if>
            <c:if test="${adminAuthArr[2] eq '1' }">
	          <li>
	            <a href="/admin/board/notice/list.do">게시판관리</a>
	            <ul class="depth2">
	              <!-- 게시판 관리 -->
					<c:forEach items="${MapValue.authMenu3List}" var="menu">
						<li <c:if test="${sub_menu_id eq menu.key }">class="on"</c:if>><a class="menu3" href="<c:out value="${MapValue.authMenuUrlCode[menu.key]}"/>"><c:out value="${menu.value }"/></a></li>
					</c:forEach>
	            </ul>
	          </li>
          	</c:if>
          	<c:if test="${adminAuthArr[3] eq '1' }">
	          <li>
	            <a href="/admin/grant/list.do">권한관리</a>
	            <!-- 권한관리 -->
					<ul class="depth2">
						<c:forEach items="${MapValue.authMenu4List}" var="menu">
							<li <c:if test="${sub_menu_id eq menu.key }">class="on"</c:if>><a class="menu4" href="<c:out value="${MapValue.authMenuUrlCode[menu.key]}"/>"><c:out value="${menu.value }"/></a></li>
						</c:forEach>
						
					</ul>
	          </li>
          	</c:if>
          	<c:if test="${adminAuthArr[4] eq '1' }">
	          <li>
	            <a href="/admin/statistics/join.do">통계관리</a>
	            <ul class="depth2">
	             <!-- 통계 관리-->
					<c:forEach items="${MapValue.authMenu5List}" var="menu">
						<li <c:if test="${sub_menu_id eq menu.key }">class="on"</c:if>><a class="menu5" href="<c:out value="${MapValue.authMenuUrlCode[menu.key]}"/>"><c:out value="${menu.value }"/></a></li>
					</c:forEach>
	            </ul>
	          </li>
          	</c:if>
          	<c:if test="${adminAuthArr[5] eq '1' }">
	          <li>
	            <a href="/admin/display/list.do">전시관리</a>
	            <ul class="depth2">
	             <!-- 통계 관리-->
					<c:forEach items="${MapValue.authMenu6List}" var="menu">
						<li <c:if test="${sub_menu_id eq menu.key }">class="on"</c:if>><a class="menu6" href="<c:out value="${MapValue.authMenuUrlCode[menu.key]}"/>"><c:out value="${menu.value }"/></a></li>
					</c:forEach>
	            </ul>
	          </li>
          	</c:if>
        </ul>
      </div>
      <div class="right">
        <ul class="top-nav">
          <!-- <li><a href="">Join us</a></li>
                <li><a href="">Login</a></li> -->
          <li><c:out value="${admin.name}" /></li>
          <li><a href="${web_server_url}/admin/logout.do">Logout</a></li>
        </ul>
      </div>
    </div>
  </div>



<div class="warp">

	<!--Lnb-->
	<%@ include file="/WEB-INF/layout/admin/admin_lnb.jsp" %>
	<!--//Lnb-->
	
	<sitemesh:write property="body" />


</div>


<div id="ajax_load_indicator"></div>
	
<!-- <div class="footerWarp"> -->
<!-- 	<div class="footer"> -->

<!-- 		<div class="copySection"> -->
			
<!-- 			<ul> -->
<!-- 				<li>COPYRIGHT© 2019 JEONBUK ALL RIGHTS RESERVED.</li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
</body>

</html>