<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>     
<head>
  <title>매입신청 STEP03</title>
</head>

<body>
	<div class="container apply">
		<section class="important-notice">
			<div class="indicater">
				<ol>
					<li><span class="circle">1</span></li>
					<li><span class="circle">2</span></li>
					<li><span class="circle on">3</span></li>
				</ol>
			</div>
		</section>
		<section class="order-confirm">
			<h2>입금완료 내역</h2>
			<div class="order-list">
				<ul>
	        		<c:forEach items="${purList}" var="list" varStatus="status">				
					<li class="item">
						<ul>
							<li>
								<dl>
									<dt>상품권 종류</dt>
									<dd><c:out value="${param.giftGubun eq 'W' ? '온라인 문화상품권':'모바일 문화상품권'}"/></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>금액</dt>
									<dd><fmt:formatNumber value="${list.REQ_MONEY }" pattern="#,###" />원</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>매수</dt>
									<dd>1매</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>매입가능여부</dt>
									<dd>
							          	<c:choose>
							          		<c:when test="${list.DEPOSIT eq 'Y' && revcCode eq '0000' }">매입성공</c:when>
							          		<c:otherwise><span class="primary">매입실패</span></c:otherwise>
							          	</c:choose>
									</dd>
								</dl>
							</li>
						</ul>
					</li>
					</c:forEach>
				</ul>
<!-- 				<ul> -->
<!-- 					<li class="item"> -->
<!-- 						<ul> -->
<!-- 							<li> -->
<!-- 								<dl> -->
<!-- 									<dt>상품권 종류</dt> -->
<%-- 									<dd><c:out value="${buyResult.giftGubun eq 'W' ? '온라인 문화상품권':'모바일 문화상품권' }"/></dd> --%>
<!-- 								</dl> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<dl> -->
<!-- 									<dt>금액</dt> -->
<%-- 									<dd><fmt:formatNumber value="${buyResult.TOTAL_REQ_MONEY }" pattern="#,###" />원</dd> --%>
<!-- 								</dl> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<dl> -->
<!-- 									<dt>매수</dt> -->
<%-- 									<dd><fmt:formatNumber value="${buyResult.TOTAL_CNT }" pattern="#,###" />매</dd> --%>
<!-- 								</dl> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</li> -->
<!-- 				</ul> -->
			</div>
			<div class="order-result">
				<ul>
				  
					<li class="item">
						<ul>
							<li>
								<dl>
									<dt>총금액</dt>
									<dd><fmt:formatNumber value="${buyResult.TOTAL_REQ_MONEY }" pattern="#,###" />원</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>매수</dt>
									<dd><fmt:formatNumber value="${buyResult.TOTAL_CNT }" pattern="#,###" />매</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>수수료(<c:out value="${buyResult.CHARGE_PER }" />%)</dt>
									<dd><fmt:formatNumber value="${buyResult.CHARGE_MONEY }" pattern="#,###" />원</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>매입가</dt>
									<dd><fmt:formatNumber value="${buyResult.TOTAL_PUR_MONEY }" pattern="#,###" />원</dd>
								</dl>
							</li>
						</ul>
					</li>
					<li class="item">
						<ul>
							<li>
								<dl>
									<dt>입금은행</dt>
									<dd><c:out value="${buyMap.BANK_NAME }" /></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>계좌번호</dt>
									<dd><c:out value="${ndn:seedDecoding(buyMap.ACNT_NUMBER) }" /></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>임금액</dt>
									<dd><fmt:formatNumber value="${buyResult.TOTAL_PUR_MONEY }" pattern="#,###" /> 원</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>매입예정</dt>
									<dd>즉시</dd>
								</dl>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</section>
		<section class="submit-btn">
			<a href="/index.do" class="btn primary lg square">확인</a>
		</section>
	</div>

</body>
