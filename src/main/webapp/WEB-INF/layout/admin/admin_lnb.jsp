<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/ndn.tld" prefix="ndn" %>


<c:if test="${ not empty menu_id  &&  not empty sub_menu_id }" >

<%--
	<div class="snb">
	
		<c:if test="${menu_id eq '01' }" ><!-- 컨텐츠 관리 -->
			<ul>				
				<c:forEach items="${MapValue.authMenu1List}" var="menu">
										
						<c:if test="${ndn:authChk(auths ,  menu.key  ) }" >				
							<li <c:if test="${sub_menu_id eq menu.key }">class="on"</c:if> ><a class="menu1" href="<c:out value="${MapValue.authMenuUrlCode[menu.key]}"/>"><c:out value="${menu.value }"/></a></li>
						</c:if>
				</c:forEach>
					
			</ul>
		</c:if>
		
		<c:if test="${menu_id eq '02' }" ><!-- 시스템 관리 -->
			<ul>
				<c:forEach items="${MapValue.authMenu2List}" var="menu">				
					<c:if test="${ndn:authChk(auths ,  menu.key  ) }" >		
						<li <c:if test="${sub_menu_id eq menu.key }">class="on"</c:if>><a class="menu2" href="<c:out value="${MapValue.authMenuUrlCode[menu.key]}"/>"><c:out value="${menu.value }"/></a></li>
					</c:if>
				</c:forEach>
			</ul>
		</c:if>
		
		 
		<c:if test="${menu_id eq '03' }" ><!-- 팝업 -->
			<ul>
				<c:forEach items="${MapValue.authMenu3List}" var="menu">
					<c:if test="${ndn:authChk(auths ,  menu.key  ) }" >		
						<li <c:if test="${sub_menu_id eq menu.key }">class="on"</c:if>><a class="menu3" href="<c:out value="${MapValue.authMenuUrlCode[menu.key]}"/>"><c:out value="${menu.value }"/></a></li>
					</c:if>
				</c:forEach>
				
			</ul>
		</c:if>
		
		<c:if test="${menu_id eq '04' }" ><!-- 채용문의 -->
			<ul>
				<c:forEach items="${MapValue.authMenu4List}" var="menu">
					<c:if test="${ndn:authChk(auths ,  menu.key  ) }" >		
						<li <c:if test="${sub_menu_id eq menu.key }">class="on"</c:if>><a class="menu4" href="<c:out value="${MapValue.authMenuUrlCode[menu.key]}"/>"><c:out value="${menu.value }"/></a></li>
					</c:if>
				</c:forEach>
				
			</ul>
		</c:if>
		
		<c:if test="${menu_id eq '05' }" ><!-- IR 관리-->
			<ul>
				<c:forEach items="${MapValue.authMenu5List}" var="menu">
					<c:if test="${ndn:authChk(auths ,  menu.key  ) }" >		
						<li <c:if test="${sub_menu_id eq menu.key }">class="on"</c:if>><a class="menu5" href="<c:out value="${MapValue.authMenuUrlCode[menu.key]}"/>"><c:out value="${menu.value }"/></a></li>
					</c:if>
				</c:forEach>
				
			</ul>
		</c:if>
		
		
		
	</div>
 --%>

</c:if>