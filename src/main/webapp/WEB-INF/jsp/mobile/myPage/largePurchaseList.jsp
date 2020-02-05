<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>

<head>
  <title>대용량 매입신청내역</title>
  
  	<script type="text/javascript">
		function go_view(seq) {
			$("#frm").attr("action" , "largePurchaseDetail.do");
			$("#seq").val(seq);
			$("#frm").submit();
		}
		function go_paging(page){
			$("#frm").attr("action" , "largePurchaseList.do");
			$("#curPage").val(page);
			$("#frm").submit();
		}
		function go_list(){
			$("#frm").attr("action" , "purchaseList.do");
			$("#frm").submit();
		}
		
		function search(){
			$("#frm").attr("action" , "largePurchaseList.do");
			$("#frm").submit();
		}
		
		/* 날짜 객체 받아서 문자열로 리턴하는 함수 */
		function getDateStr(myDate){
		    var year = myDate.getFullYear();            
		    var month = (1 + myDate.getMonth());        
		    month = month >= 10 ? month : '0' + month; 
		    var day = myDate.getDate();                   
		    day = day >= 10 ? day : '0' + day;          
		    return  year + '-' + month + '-' + day;
		}
	
		/* 오늘 날짜를 문자열로 반환 */
		function today() {
		  var d = new Date()
		  return getDateStr(d)
		}
	
		/* 오늘로부터 1주일전 날짜 반환 */
		function lastWeek() {
		  var d = new Date()
		  var dayOfMonth = d.getDate()
		  d.setDate(dayOfMonth - 7)
		  return getDateStr(d)
		}
	
		/* 오늘로부터 3개월전 날짜 반환 */
		function threeMonth() {
		  var d = new Date()
		  var monthOfYear = d.getMonth()
		  d.setMonth(monthOfYear - 3)
		  return getDateStr(d)
		}
	
		/* 오늘로부터 6개월전 날짜 반환 */
		function sixMonth() {
		  var d = new Date()
		  var monthOfYear = d.getMonth()
		  d.setMonth(monthOfYear - 6)
		  return getDateStr(d)
		}
	
		function pick(date) {
			  $("#endDate").val(today())
			if( date == "today"){
			    $("#startDate").val(today())
			  }else if(date == "week") {
			  	$("#startDate").val(lastWeek())
			  }else if(date == "threeMonth") {
			  	$("#startDate").val(threeMonth())
			  }else if(date == "sixMonth") {
			  	$("#startDate").val(sixMonth())
			  }
			  search();
		}
	</script>
</head>

<body>

	<div class="container buy-list">
		<section class="search">
			<div class="anchor">
				<a href="${web_ssl_url}/m/myPage/purchaseList.do" class="btn text primary sm">
					<span>일반 매입신청 내역</span>
					<svg 
					  xmlns="http://www.w3.org/2000/svg"
					  xmlns:xlink="http://www.w3.org/1999/xlink"
					  viewBox="0 0 11 21"
					  width="5.5" height="12">
					<path fill-rule="evenodd"  fill="rgb(255, 92, 92)"
					  d="M8.712,10.504 L0.272,19.341 C-0.099,19.723 -0.099,20.337 0.272,20.719 C0.643,21.102 1.238,21.102 1.609,20.719 L10.722,11.190 C11.093,10.807 11.093,10.194 10.722,9.811 L1.609,0.289 C1.427,0.101 1.182,0.000 0.944,0.000 C0.706,0.000 0.461,0.094 0.279,0.289 C-0.092,0.671 -0.092,1.285 0.279,1.667 L8.712,10.504 Z"/>
					</svg>
				</a>
			</div>
			<form action="" name="frm" id="frm" method="post">
			<input type="hidden" id="seq" name="seq" value="" />
			<input type="hidden" id="curPage" name="curPage" value="" />
			<div class="toggle-wrap">
				<ul>
					<li>
						<input type="radio" onclick="pick('today')" name="search-range" id="today">
						<label for="today">당일</label> 
					</li>
					<li>
						<input type="radio"  onclick="pick('week')" name="search-range" id="a-week">
						<label for="a-week">1주일</label> 
					</li>
					<li>
						<input type="radio" onclick="pick('threeMonth')" name="search-range" id="three-month">
						<label for="three-month">3개월</label> 
					</li>
					<li>
						<input type="radio" onclick="pick('sixMonth')" name="search-range" id="half-year">
						<label for="half-year">6개월</label> 
					</li>
				</ul>
			</div>
			<div class="custom-range">
				<a href="" class="btn toggle">날짜지정</a>
				<div class="date-pick input-text-wrap underline-type">
					<input name="dates" onfocus="blur()">
				<span class="icon-calendar"></span>
			</div>
			</div>
			<div class="btn-wrap">
				<a href="" class="btn md square primary">조회하기</a>
			</div>
			</form>
		</section>

		<section class="order-list">
			<ul>
				<c:if test="${empty listHelper.list}">
				<li>
					<div class="card">
						<div class="card-body">
							<p class="no-list">
							 	주문내역 없음
							</p>
						</div>
					</div>
				</li>
        		</c:if>
				<c:forEach items="${listHelper.list}" var="list" varStatus="status">
				<li onclick="go_view(<c:out value='${list.SEQ}'/>)">
					<div class="card">
						<div class="card-header">
							주문번호 (<c:out value="${list.rownum}"/>)
						</div>
						<div class="card-body">
							<ul>
								<li>
									<dl>
										<dt>신청 핀코드수</dt>
										<dd><c:out value="${list.finCount}"/></dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>신청 핀코드 액면가</dt>
										<dd><c:out value="${list.moneySum}"/></dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>정상/비정상</dt>
										<dd><c:out value="${list.normal}"/>/<c:out value="${list.abnormal}"/></dd>
									</dl>
								</li>								
								<li>
									<dl>
										<dt>매입금액</dt>
										<dd><c:out value="${list.realSum}"/></dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>입금일자</dt>
										<dd><c:out value="${list.date}"/></dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>상태</dt>
										<dd><c:out value="${list.state}"/></dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>메모</dt>
										<dd><c:out value="${list.CONTENTS}"/></dd>
									</dl>
								</li>								
							</ul>
						</div>
					</div>
				</li>
				</c:forEach>				
			</ul>
			<div class="btn-wrap">
				<a href="" class="btn more square lg">더보기</a>
			</div>
    	</section>
	</div>
</body>

  <div class="section">
    <div class="wrapper">
      <div class="buy-header">
        <h1>마이페이지</h1>
      </div>

      <ul class="mypage-tab">
        <li class="list1 on"><a href="#">매입신청내역</a></li>
        <li class="list2"><a href="#">계좌인증</a></li>
        <li class="list3"><a href="#">매입한도</a></li>
        <li class="list4"><a href="#">개인정보수정</a></li>
      </ul>

      <div class="topper-btn-wrap">
        <button type="button" onclick="go_list()" class="line-btn">일반 대량매입신청 내역</button>
      </div>
      
	  <form action="" name="frm" id="frm" method="post">
	  <input type="hidden" id="seq" name="seq" value="" />
	  <input type="hidden" id="curPage" name="curPage" value="" />      
      <div class="date-join">
        <ul>
          <li>기간조회</li>
          <li><button type="button" onclick="pick('today')"> 당일</button></li>
          <li><button type="button" onclick="pick('week')"> 1주일</button></li>
          <li><button type="button" onclick="pick('threeMonth')"> 3개월</button></li>
          <li><button type="button" onclick="pick('sixMonth')"> 6개월</button></li>
          <li>날짜지정</li>
        </ul>
        <span class="date-sele">
        <input type="text" name="startDate" id="startDate" value="<c:out value="${param.startDate }" />" />-<input type="text" name="endDate" id="endDate" value="<c:out value="${param.endDate }" />" /> <input type="button" onclick="search()" value="조회">
        </span>
      </div> 
      </form>
      <table class="buy-list">
        <colgroup>
          <col style="width: auto;">
          <col style="width: auto;">
          <col style="width: auto;">
          <col style="width: auto;">
          <col style="width: auto;">
          <col style="width: 230px;">
          <col style="width: 90px;">
          <col style="width: 90px;">
        </colgroup>

        <tr class="thead">
          <th>주문번호</th>
          <th>신청 핀코드 수</th>
          <th>신청 핀코드액면가</th>
          <th>정상/비정상</th>
          <th>매입금액</th>
          <th>접수/입금일자</th>
          <th>메모</th>
          <th>상태</th>
        </tr>
        <c:forEach items="${listHelper.list}" var="list" varStatus="status">
	        <tr onclick="go_view(<c:out value='${list.SEQ}'/>)">
	          <th><c:out value="${list.rownum}"/></th>
	          <th><c:out value="${list.finCount}"/></th>
	          <th><c:out value="${list.moneySum}"/></th>
	          <th><c:out value="${list.normal}"/>/<c:out value="${list.abnormal}"/></th>
	          <th><c:out value="${list.realSum}"/></th>
	          <th><c:out value="${list.date}"/></th>
	          <th onclick="event.cancelBubble = true;"><button class="agree" type="button" onclick="purchasePop(<c:out value='${list.SEQ}'/>)">보기</button></th>
<!-- 	          <th onclick="event.cancelBubble = true;"><button class="line-btn-sm" onclick="go_list()">보기</button></th> -->
	          
              <div class="popup popup<c:out value='${list.SEQ}'/>" style="display: none;">
                <div class="pop_title">
                 	 관리자 메모
                  <button href="javascript:;" type="button" onclick="close1('popup','popback')">X</button>
                </div>
                <div class="pop_text" style="height:300px;">
                	<c:out value="${list.CONTENTS}"/>
                </div>
              </div>
	          
	          <th><c:out value="${list.state}"/></th>
	        </tr>
		</c:forEach>
        		<div class="popback"></div>
		<c:if test="${empty listHelper.list}">
	        <tr>
	          <th colspan="8">매입신청 내역이 없습니다.</th>
	        </tr>
	        <tr>
	          <th colspan="8"></th>
	        </tr>
		</c:if>
      </table>
	  <div class="paging">
		<ndn:paging listHelper="${listHelper}"/>
	  </div>
    </div>
  </div>
</body>