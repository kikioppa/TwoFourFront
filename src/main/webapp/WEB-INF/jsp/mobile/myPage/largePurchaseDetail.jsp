<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<head>
  <title>대용량 매입신청내역 상세</title>
  <script type="text/javascript">
	  function go_list(){
			$("#frm").attr("action" , "largePurchaseList.do");
			$("#frm").submit();
		}
		
		function moreList(curPage){
	    	$("#curPage").val(curPage);
			$.ajax({
				url : "./largePurchaseDetailMoreList.json",
				type : "POST",
				cache : false,
				dataType: 'json',
				data : $("#frm").serialize(), 
				success : function(data){
					var content="";
					var button="";
					for(var i=0; i<data.list.length; i++){
						content += 
					        "<li class='item'>" + 
					          "<ul>" + 
					            "<li>" + 
					              "<dl>" + 
					                "<dt>핀번호</dt>" + 
					                "<dd>" + data.list[i].FIN_NUMBER + "</dd>" + 
					              "</dl>" + 
					            "</li>" + 
					            "<li>" + 
					              "<dl>" + 
					                "<dt>금액</dt>" + 
					                "<dd>" + data.list[i].REQ_MONEY + "</dd>" + 
					              "</dl>" + 
					            "</li>" + 
					            "<li>" + 
					              "<dl>" + 
					                "<dt>성공여부</dt>";
								      if(data.list[i].SUCCESS_YN == 'Y'){
								    	  content += "<dd><span>성공</span></dd>";
								      }else{
								    	  content += "<dd><span class='primary'>실패</span></dd>";
								      }
								content += "</dl>" + 
					            "</li>" + 
					            "<li>" + 
					              "<dl>" + 
					                "<dt>실패이유</dt>" + 
					                "<dd>";
					                	if(data.list[i].SUCCESS_YN == 'Y'){
					                		content += "-";
					                	}else{
					                		content += data.list[i].FAIL_REASON;
					                	}
					                content += "</dd>" + 
					              "</dl>" + 
					            "</li>" + 
					          "</ul>" + 
					        "</li>";
					}
					
					button+="<div class='btn-wrap' id='btn-wrap'><a href='javascript:moreList("+data.curPage+")' class='btn more square lg'>더보기</a></div>";
					$('#btn-wrap').remove();//remove btn
					$(content).appendTo(".order-list-detail > ul");
					if(!data.last){
						$(button).appendTo(".order-list-detail");
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
    <section class="order-list-detail">
      <ul>     
        <c:forEach items="${listHelper.list}" var="list" varStatus="status">
	        <li class="item">
	          <ul>
	            <li>
	              <dl>
	                <dt>핀번호</dt>
	                <dd><c:out value="${list.FIN_NUMBER}"/></dd>
	              </dl>
	            </li>
	            <li>
	              <dl>
	                <dt>금액</dt>
	                <dd><c:out value="${list.REQ_MONEY}"/></dd>
	              </dl>
	            </li>
	            <li>
	              <dl>
	                <dt>성공여부</dt>
				      <c:choose>
					  	<c:when test="${list.SUCCESS_YN eq 'Y'}">
	                		<dd><span>성공</span></dd>
						</c:when>
						<c:otherwise>
	                		<dd><span class="primary">실패</span></dd>
						</c:otherwise>
					  </c:choose>
	              </dl>
	            </li>
	            <li>
	              <dl>
	                <dt>실패이유</dt>
	                <dd><c:if test="${list.SUCCESS_YN eq 'Y'}">-</c:if><c:out value="${list.FAIL_REASON}"/></dd>
	              </dl>
	            </li>
	          </ul>
	        </li>
		</c:forEach>
      </ul>
	  <c:if test="${listHelper.totalPage > 1}">
		<div class="btn-wrap" id="btn-wrap">
			<a href="javascript:moreList(2)" class="btn more square lg">더보기</a>
		</div>
	  </c:if>
      <div class="btn-wrap">
        <a href="javascript:void(0)" class="btn minor lg square" onclick="go_list()">목록보기</a>
      </div>
	  <form action="" method="post" name="frm" id="frm">
		  <input type="hidden" id="seq" name="seq" value="<c:out value="${seq}"/>"/>
		  <input type="hidden" id="curPage" name="curPage" value=""/>      
	  </form>
    </section>
  </div>
</body>