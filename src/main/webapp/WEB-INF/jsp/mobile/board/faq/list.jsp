<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<head>
  <title>FAQ</title>
  <script type="text/javascript">

    function moreList(curPage){
    	$("#categorySeq").val($(".on > input").val());
    	$("#curPage").val(curPage);
		$("#searchYn").val("Y");
		$.ajax({
			url : "/m/board/FAQ/moreList.json",
			type : "POST",
			cache : false,
			dataType: 'json',
			data : $("#frm").serialize(), 
			success : function(data){
				var content="";
				var button="";
				for(var i=0; i<data.list.length; i++){
					content +=
					"<li class='has-child'>" +
						"<a onclick='slideDownChild(this);'>" +
							"<span class='title'><em>["+data.list[i].CATE_NAME+"]</em>"+data.list[i].INQUIRY_CONTENTS+"</span>" +
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
					"<li class='child' style='display: none;'>" +
						"<pre>"+data.list[i].ANSWER_CONTENTS+"</pre>" +
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
    
    function cate_change(seq){
    	$("#searchKeyword").val('');
    	$("#curPage").val('');
    	$("#frm").attr("action" , "list.do");
    	$("#categorySeq").val(seq);
    	$("#frm").submit();
    }
    
    function search(){	
    	$("#frm").attr("action" , "list.do");
    	$("#categorySeq").val($(".on > input").val());
		$("#searchYn").val("Y");
		$("#frm").submit();
    }
  </script>
</head>

<body>

	<div class="container faq">
		<section class="search">
		<form name="frm" id="frm" method="post">
			<input type="hidden" name="categorySeq" id="categorySeq" value="">
			<input type="hidden" id="curPage" name="curPage" value="" />
			<input type="hidden" id="searchYn" name="searchYn" value="">
			<input type="hidden" id="searchCondition" name="searchCondition" value="title">		
			<div class="input-text-wrap">
				<input type="text" name="searchKeyword" id="searchKeyword" maxlength="30" value="<c:out value='${param.searchKeyword}'/>" placeholder="검색어를 입력해주세요">
				<button type="button" onclick="search();" class="search-btn">
					<span class="icon">
						<svg 
						  xmlns="http://www.w3.org/2000/svg"
						  xmlns:xlink="http://www.w3.org/1999/xlink"
						  viewBox="0 0 35 35"
						  width="17.5" height="17.5">
						  <path fill-rule="evenodd"  fill="rgb(223, 0, 0)"
						  d="M34.676,33.215 L26.174,24.709 C28.454,22.086 29.835,18.664 29.835,14.923 C29.835,6.689 23.141,-0.000 14.918,-0.000 C6.687,-0.000 -0.000,6.697 -0.000,14.923 C-0.000,23.149 6.695,29.847 14.918,29.847 C18.657,29.847 22.078,28.465 24.700,26.184 L33.202,34.689 C33.404,34.891 33.675,35.000 33.939,35.000 C34.203,35.000 34.474,34.899 34.676,34.689 C35.079,34.286 35.079,33.618 34.676,33.215 ZM2.087,14.923 C2.087,7.846 7.843,2.095 14.910,2.095 C21.985,2.095 27.733,7.853 27.733,14.923 C27.733,21.993 21.985,27.759 14.910,27.759 C7.843,27.759 2.087,22.001 2.087,14.923 Z"/>
						</svg>
					</span>
				</button>
			</div>
			<div class="quick-tag">
				<ul>
					<c:forEach items="${categoryList}" var="list" varStatus="status">
						<li <c:if test="${listHelper.list[0].CATE_SEQ == list.SEQ}">class="on"</c:if>>
							<a href="javascript:cate_change(<c:out value='${list.SEQ}'/>)"><c:out value="${list.CATE_NAME}"/></a>
							<input type="hidden" value="<c:out value='${list.SEQ}'/>">
						</li>
					</c:forEach>        
<!--           <li class="on"><a href="">전체</a></li> -->
<!--           <li><a href="">회원</a></li> -->
<!--           <li><a href="">구매</a></li> -->
<!--           <li><a href="">취소</a></li> -->
<!--           <li><a href="">기타</a></li> -->
				</ul>
			</div>
		</form>
		</section>
		<section class="board-list" id="board-list">
			<div class="accordion-list">
				<ul id="list">
					<c:forEach items="${listHelper.list}" var="list" varStatus="status">
						<li class="has-child">
							<a href="" onclick="slideDownChild(this);">
								<span class="title"><em>[<c:out value="${list.CATE_NAME}"/>]</em><c:out value="${list.INQUIRY_CONTENTS}" escapeXml="false"/></span>
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
						<li class="child">
							<pre><c:out value="${list.ANSWER_CONTENTS}" escapeXml="false"/></pre>
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
	<script>
	 //
	 $(document).ready(function() {
	   //아코디언 리스트 접어두기
	   $('.board-list .accordion-list .child').slideUp(5);
	 });
	 
	 //FAQ 검색 태그 버튼
	 //quickTag();
	</script>
</body>

