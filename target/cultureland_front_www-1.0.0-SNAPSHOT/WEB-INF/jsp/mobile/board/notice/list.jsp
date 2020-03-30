<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<head>
<title>공지사항</title>
<script type="text/javascript">
	function go_view(noticeId, rownum) {
		$("#frm").attr("action" , "detail.do");
		$("#noticeId").val(noticeId);
		$("#rownum").val(rownum);
		$("#frm").submit();
	}
    function moreList(curPage){
    	$("#curPage").val(curPage);
		$("#searchYn").val("Y");
		$.ajax({
			url : "/m/board/notice/moreList.json",
			type : "POST",
			cache : false,
			dataType: 'json',
			data : $("#frm").serialize(), 
			success : function(data){
				var content="";
				var button="";
				for(var i=0; i<data.list.length; i++){
					content +=
						"<li>" + 
							"<a href='javascript:go_view("+data.list[i].seq+", "+data.list[i].rownum+")'>" + 
								"<div class='title'>" + 
									"<div class='ellipse'>" + 
										"<div class='title-text'>" + 
										data.list[i].title +  
									"</div>";
									if(data.list[i].atch_file_id != '' && data.list[i].atch_file_id != null){
										content += "<svg " + 
										  "xmlns='http://www.w3.org/2000/svg'" + 
										  "xmlns:xlink='http://www.w3.org/1999/xlink'" + 
										  "viewBox='0 0 25 26'" + 
										  "width='13' height='12.5'>" + 
										  "<path fill-rule='evenodd'  fill='rgb(153, 153, 153)'" + 
										  "d='M19.563,10.679 C19.563,10.679 20.574,9.877 19.805,9.076 C19.035,8.276 18.287,9.309 18.287,9.309 L10.550,17.373 C10.550,17.373 8.737,19.809 7.360,18.336 C5.984,16.861 8.284,15.011 8.284,15.011 L18.429,4.441 C18.429,4.441 20.796,1.723 23.021,4.041 C25.244,6.360 22.628,8.832 22.628,8.832 L11.230,20.709 C11.230,20.709 7.582,25.099 4.206,21.580 C0.830,18.062 5.085,14.304 5.085,14.304 L13.739,5.285 C13.739,5.285 14.708,4.441 13.982,3.682 C13.252,2.924 12.445,3.935 12.445,3.935 L2.514,14.283 C2.514,14.283 -1.234,18.567 2.952,22.928 C7.138,27.291 11.252,23.386 11.252,23.386 L24.900,9.162 C24.900,9.162 27.631,6.024 24.376,2.630 C21.120,-0.765 18.107,2.081 18.107,2.081 L6.363,14.316 C6.363,14.316 3.355,16.866 6.084,19.708 C8.813,22.554 11.216,19.373 11.216,19.373 L19.563,10.679 Z'/>" + 
										"</svg>";
									}
									content += "</div>" + 
									"<ul class='detail'>" + 
										"<li class='catagory ";
										if(data.list[i].notice_yn == 'Y'){
											content += "primary'>공지</li>";
										}else{
											content += "'>서비스</li>";
										}
										content += "<li class='date'>" + data.list[i].creation_date + "</li>" + 
									"</ul>" + 
								"</div>" + 
								"<div class='suffix'>" + 
									"<span class='icon-arrow'></span>" + 
								"</div>" + 
							"</a>" + 
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
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}	
	function search(){
		$("#frm").attr("action" , "list.do");
		$("#searchYn").val("Y");
		$("#frm").submit();
	}
</script>
</head>
<body>
	<div class="container notice">

	  <form action="" name="frm" id="frm" method="post">
	  	<input type="hidden" name="noticeId" id="noticeId" value="">
	  	<input type="hidden" name="rownum" id="rownum" value="">
		<input type="hidden" id="curPage" name="curPage" value="" />
		<input type="hidden" id="searchYn" name="searchYn" value="">
		<section class="board-list" id="board-list">
			<div class="links">
				<ul id="list">
					<c:forEach items="${listHelper.list}" var="list" varStatus="status">
						<li>
							<a href="javascript:go_view(<c:out value='${list.seq}'/>, <c:out value='${list.rownum}'/>)">
								<div class="title">
									<div class="ellipse">
										<div class="title-text">
										<c:out value="${list.title}"/>
									</div>
									<c:if test="${not empty list.atch_file_id}">		
										<svg 
										  xmlns="http://www.w3.org/2000/svg"
										  xmlns:xlink="http://www.w3.org/1999/xlink"
										  viewBox="0 0 25 26"
										  width="13" height="12.5">
										  <path fill-rule="evenodd"  fill="rgb(153, 153, 153)"
										  d="M19.563,10.679 C19.563,10.679 20.574,9.877 19.805,9.076 C19.035,8.276 18.287,9.309 18.287,9.309 L10.550,17.373 C10.550,17.373 8.737,19.809 7.360,18.336 C5.984,16.861 8.284,15.011 8.284,15.011 L18.429,4.441 C18.429,4.441 20.796,1.723 23.021,4.041 C25.244,6.360 22.628,8.832 22.628,8.832 L11.230,20.709 C11.230,20.709 7.582,25.099 4.206,21.580 C0.830,18.062 5.085,14.304 5.085,14.304 L13.739,5.285 C13.739,5.285 14.708,4.441 13.982,3.682 C13.252,2.924 12.445,3.935 12.445,3.935 L2.514,14.283 C2.514,14.283 -1.234,18.567 2.952,22.928 C7.138,27.291 11.252,23.386 11.252,23.386 L24.900,9.162 C24.900,9.162 27.631,6.024 24.376,2.630 C21.120,-0.765 18.107,2.081 18.107,2.081 L6.363,14.316 C6.363,14.316 3.355,16.866 6.084,19.708 C8.813,22.554 11.216,19.373 11.216,19.373 L19.563,10.679 Z"/>
										</svg>
									</c:if>
									</div>
									<ul class="detail">
										<li class="catagory <c:if test="${list.notice_yn eq 'Y'}">primary</c:if>"><c:out value="${list.notice_yn eq 'Y' ? '공지':'서비스'}"/></li>
										<li class="date"><fmt:formatDate value="${list.creation_date}" pattern="yyyy-MM-dd"/></li>
										<!-- <li class="new primary">NEW</li> 날짜 체크 후 삽입 -->
									</ul>
								</div>
								<div class="suffix">
									<span class="icon-arrow"></span>
								</div>
							</a>
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
</body>