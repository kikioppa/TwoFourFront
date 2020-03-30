<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<head>
  <title>1:1문의</title>
  <script>
	function go_write(){
		$("#frm").attr("action" , "/m/board/inquiry/write.do");
		$("#frm").submit();
	}
    function moreList(curPage){
    	$("#curPage").val(curPage);
		$.ajax({
			url : "./questionMoreList.json",
			type : "POST",
			cache : false,
			dataType: 'json',
			data : $("#frm").serialize(), 
			success : function(data){
				var content="";
				var button="";
				for(var i=0; i<data.list.length; i++){
					console.log(data.list[i].title);
					content +=
						"<li class='has-child'>" + 
							"<a onclick='slideDownChild(this);'>" + 
							"<div class='title'>" + 
								"<div class='ellipse'>" + 
									"<div class='title-text'>" + 
									 data.list[i].title + 
									"</div>" + 
								"</div>" + 
								"<ul class='detail'>" + 
									"<li class='catagory ";
									if(data.list[i].inq_yn == "Y"){
										content += "primary'>답변완료</li>";
									}else{
										content +="'>답변대기</li>";
									}
									content +="<li class='date'>" + data.list[i].creation_date + "</li>" +
								"</ul>" +
							"</div>" +
							"<span class='icon'>" +
								"<svg " +
								   "xmlns='http://www.w3.org/2000/svg'" +
								   "xmlns:xlink='http://www.w3.org/1999/xlink'" +
								   "viewBox='0 0 29 15'" +
								   "width='14.5' height='7.5'>" +
								   "<path fill-rule='evenodd'  fill='rgb(223, 0, 0)'" +
								   "d='M14.496,12.712 L1.659,0.272 C1.277,-0.099 0.663,-0.099 0.281,0.272 C-0.102,0.643 -0.102,1.238 0.281,1.609 L13.810,14.722 C14.193,15.093 14.806,15.093 15.189,14.722 L28.711,1.609 C28.899,1.427 29.000,1.182 29.000,0.944 C29.000,0.706 28.906,0.461 28.711,0.279 C28.329,-0.092 27.715,-0.092 27.333,0.279 L14.496,12.712 Z'/>" +
								"</svg>" +
							"</span>" +
						"</a>" +
					"</li>" +
					"<li class='child' style='display: none;'>";
						if(data.list[i].contents == null){
							content +="<pre>아직 답변되지 않은 문의입니다.</pre>";
						}
						content +="<pre>" + data.list[i].contents + "</pre>" + 
					"</li>";
				}
				
				button+="<div class='btn-wrap' id='btn-wrap'><a href='javascript:moreList("+data.curPage+")' class='btn more square lg'>더보기</a></div>";
				$('#btn-wrap').remove();//remove btn
				$(content).appendTo("#list");
				if(!data.last){
					$(button).appendTo("#board-list");
				}
			}, error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}	
  </script>
</head>

<body>

<div class="container faq notice">
		<section class="board-list" id="board-list">
			<div class="accordion-list links">
				<div class="anchor" style="text-align: right;">
					<a href="javascript:void(0);" onclick="javascript:go_write()" class="btn text primary sm">
						<span>1:1 문의 하기</span>
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
				<ul id="list">
					<c:forEach items="${listHelper.list}" var="list" varStatus="status">
						<li class="has-child">
							<a onclick="slideDownChild(this);">
								<div class="title">
									<div class="ellipse">
										<div class="title-text">
											<c:out value="${list.title}"/>
										</div>
									</div>
									<ul class="detail">
										<li class="catagory <c:if test="${list.inq_yn eq 'Y'}">primary</c:if>"><c:out value="${list.inq_yn ne 'Y' ? '답변대기':'답변완료'}"/></li>
										<li class="date"><fmt:formatDate value="${list.creation_date}" pattern="yyyy-MM-dd"/></li>
									</ul>
								</div>
								<span class="icon">
									<svg 
									   xmlns="http://www.w3.org/2000/svg"
									   xmlns:xlink="http://www.w3.org/1999/xlink"
									   viewBox="0 0 29 15"
									   width="14.5" height="7.5">
									   <path fill-rule="evenodd"  fill="rgb(223, 0, 0)"
									   d="M14.496,12.712 L1.659,0.272 C1.277,-0.099 0.663,-0.099 0.281,0.272 C-0.102,0.643 -0.102,1.238 0.281,1.609 L13.810,14.722 C14.193,15.093 14.806,15.093 15.189,14.722 L28.711,1.609 C28.899,1.427 29.000,1.182 29.000,0.944 C29.000,0.706 28.906,0.461 28.711,0.279 C28.329,-0.092 27.715,-0.092 27.333,0.279 L14.496,12.712 Z"/>
									</svg>
								</span>
							</a>
						</li>
						<li class="child" style='display: none;'>
	              			<pre><c:if test="${empty list.contents}">아직 답변되지 않은 문의입니다.</c:if></pre>
							<pre><c:out value="${list.contents}" escapeXml="false"/></pre>
						</li>
					</c:forEach>
				</ul>
			</div>
			<c:if test="${listHelper.totalPage > 1}">
				<div class="btn-wrap" id="btn-wrap">
					<a href="javascript:moreList(2)" class="btn more square lg">더보기</a>
				</div>
			</c:if>
		</section>
	</div>
	<form name="frm" id="frm" method="post">
		<input type="hidden" id="curPage" name="curPage" value="" />
	</form>
</body>
