<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<head>
	<title>매입신청내역</title>
	<script type="text/javascript">
	$(document).ready(function() {
		$('.date-pick input[name="dates"]').daterangepicker({
		    locale: {
		      format: "YYYY-MM-DD",
		      cancelLabel: '취소',
		      applyLabel: "적용",
		      daysOfWeek: ["일","월","화","수","목","금","토"],
		      monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
		    },
		    startDate: new Date(),
		    endDate: new Date(),
		    buttonClasses: "btn toggle",
		    applyButtonClasses: "apply",
		    cancelClass: "cancel"
		 });		
		$('.date-pick input[name="dates"]').on('showCalendar.daterangepicker', function(){
			$('.daterangepicker').css('display', 'flex');
		})
		//날짜지정 시 radio에서 checked 빼기
		$('.date-pick input[name="dates"]').click(function(){
			$('.custom-range .btn.toggle').addClass('on');
			$('.toggle-wrap input[type="radio"]').prop("checked", false);
		})
		$('.custom-range .btn.toggle').click(function(e){
			$(this).addClass('on');
			$('.toggle-wrap input[type="radio"]').prop("checked", false);
		});
		//radio check시 날짜지정에서 빼기
		$('.toggle-wrap input[type="radio"]').change(function(){
			$('.custom-range .btn.toggle').removeClass('on');
		});
	});

    
	function date_set(startDate,endDate){
	  $('.date-pick input[name="dates"]').data('daterangepicker').setStartDate(startDate);
	  $('.date-pick input[name="dates"]').data('daterangepicker').setEndDate(endDate);	  	
	}
      
	function go_view(seq) {
		$("#frm").attr("action" , "purchaseDetail.do");
		$("#seq").val(seq);
		$("#frm").submit();
	}
	
	function go_paging(page){
		$("#frm").attr("action" , "purchaseList.do");
		$("#curPage").val(page);
		$("#frm").submit();
	}
	
	function go_search(){
		$("#frm").attr("action" , "purchaseList.do");
		$("#startDate").val($('.date-pick input[name="dates"]').data('daterangepicker').startDate.format('YYYY-MM-DD'));
		$("#endDate").val($('.date-pick input[name="dates"]').data('daterangepicker').endDate.format('YYYY-MM-DD'));
    	$("#curPage").val('');
		$("#frm").submit();
	}
	
	function moreList(curPage){
    	$("#curPage").val(curPage);
		$.ajax({
			url : "./purchaseMoreList.json",
			type : "POST",
			cache : false,
			dataType: 'json',
			data : $("#frm").serialize(), 
			success : function(data){
				var content="";
				var button="";
				for(var i=0; i<data.list.length; i++){
					content +=
						"<li onclick='go_view("+data.list[i].SEQ+")'>" + 
						"<div class='card'>" + 
							"<div class='card-header'>" + 
								"주문번호 ("+data.list[i].rownum+")" + 
							"</div>" + 
							"<div class='card-body'>" + 
								"<ul>" + 
									"<li>" + 
										"<dl>" + 
											"<dt>신청 핀코드수</dt>" + 
											"<dd>"+data.list[i].finCount+"</dd>" + 
										"</dl>" + 
									"</li>" + 
									"<li>" + 
										"<dl>" + 
											"<dt>신청 핀코드 액면가</dt>" + 
											"<dd>"+data.list[i].moneySum+"</dd>" + 
										"</dl>" + 
									"</li>" + 
									"<li>" + 
										"<dl>" + 
											"<dt>매입금액</dt>" + 
											"<dd>"+data.list[i].realSum+"</dd>" + 
										"</dl>" + 
									"</li>" + 
									"<li>" + 
										"<dl>" + 
											"<dt>입금일자</dt>" + 
											"<dd>"+data.list[i].date+"</dd>" + 
										"</dl>" + 
									"</li>" + 
									"<li>" + 
										"<dl>" + 
											"<dt>상태</dt>" + 
											"<dd>"+data.list[i].state+"</dd>" + 
										"</dl>" + 
									"</li>" + 
								"</ul>" + 
							"</div>" + 
						"</div>" + 
					"</li>";
				}
				
				button+="<div class='btn-wrap' id='btn-wrap'><a href='javascript:moreList("+data.curPage+")' class='btn more square lg'>더보기</a></div>";
				$('#btn-wrap').remove();//remove btn
				$(content).appendTo(".order-list > ul");
				if(!data.last){
					$(button).appendTo(".order-list");
				}
			}, error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}	
	</script>
</head>

<body>
	<div class="container buy-list">
		<section class="search">
			<div class="anchor">
				<a href="${web_ssl_url}/m/myPage/largePurchaseList.do" class="btn text primary sm">
					<span>대용량매입신청 내역</span>
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
			<form name="frm" id="frm" method="post">
			<input type="hidden" id="seq" name="seq" value="" />
			<input type="hidden" id="curPage" name="curPage" value="" />
			<input type="hidden" id="startDate" name="startDate" value="<c:out value="${startDate}"/>" />
			<input type="hidden" id="endDate" name="endDate" value="<c:out value="${endDate}"/>" />
			<div class="toggle-wrap">
				<ul>
					<li>
						<input type="radio" onclick="date_set(addDate(0,0),curDate());" name="search-range" id="today">
						<label for="today">당일</label> 
					</li>
					<li>
						<input type="radio"  onclick="date_set(addDate(0,-7),curDate());" name="search-range" id="a-week">
						<label for="a-week">1주일</label> 
					</li>
					<li>
						<input type="radio" onclick="date_set(addDate(-1,0),curDate());" name="search-range" id="three-month">
						<label for="three-month">3개월</label> 
					</li>
					<li>
						<input type="radio" onclick="date_set(addDate(-6,0),curDate());" name="search-range" id="half-year">
						<label for="half-year">6개월</label> 
					</li>
				</ul>
			</div>
			<div class="custom-range">
				<a href="#" class="btn toggle">날짜지정</a>
				<div class="date-pick input-text-wrap underline-type">
					<input name="dates" onfocus="blur()">
				<span class="icon-calendar"></span>
			</div>
			</div>
			<div class="btn-wrap">
				<a href="#" onclick="go_search();" class="btn md square primary">조회하기</a>
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
							</ul>
						</div>
					</div>
				</li>
				</c:forEach>				
			</ul>
			<c:if test="${listHelper.totalPage > 1}">
				<div class="btn-wrap" id="btn-wrap">
					<a href="javascript:moreList(2)" class="btn more square lg">더보기</a>
				</div>
			</c:if>
    	</section>
	</div>
</body>
