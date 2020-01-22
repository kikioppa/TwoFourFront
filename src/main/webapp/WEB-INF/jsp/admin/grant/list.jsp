<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>관리자 페이지-권한관리</title>
  
  <script type="text/javascript">
  	function go_view(seq){
  		$("#seq").val(seq);
  		$("#frm").attr('action', './write.do');
  		$("#frm").submit();
  	}
  	
  	function fn_delete(seq){
  		if (confirm("삭제하시겠습니까?")){
  			$("#seq").val(seq);
  			
  			var option = {
  					type : "post",
  					url: './del_proc.json',
  					data: $("#frm").serialize() ,
  					dataType: 'json',
  					beforeSend: function() {
  						$('#ajax_load_indicator').show();
  					},
  					success : function(data) {
  						if(data.success){
  							alert('삭제되였습니다.');
  							location.reload();
  						}else{
  							alert('실패 하였습니다.');
  						}
  					},
  					error: function(request, status, err) {
  						//alert('서버와의 통신이 실패했습니다.');
  						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+err);
  					},
  					complete : function() {
  						$('#ajax_load_indicator').hide();
  					}
  				};
  		
  				$("#frm").ajaxSubmit(option);
  		}
  	}
  	
  </script>
  
</head>

<body>
  <!--section-->
  <form name="frm" id="frm" method="post">
  	  <input type="hidden" name="seq" id="seq" value="" />
	  <div class="grant-list">
	    <div class="info-header">
	      <h2>권한관리</h2>
	    </div>
	    <div class="breadcrumbs">
	      <a href="#" class="home"><span>home</span></a>
	      <span>권한관리</span>
	    </div>
	    <div class="user-list">
	      <ul class="list-header">
	        <li>번호</li>
	        <li>권한명</li>
	        <li>이름</li>
	        <li>권한 수정</li>
	        <li>삭제 처리</li>
	      </ul>
	      <c:forEach items="${listHelper.list }" var="list" varStatus="status">
		      <ul>
		        <li><c:out value="${list.rownum }" /></li>
		        <li><c:out value="${list.POSITION }" /></li>
		        <li><c:out value="${list.CUL_NAME }" /></li>
		        <li><a href="javascript:go_view('<c:out value="${list.SEQ }" />');">수정</a></li>
		        <li><a href="javascript:fn_delete('<c:out value="${list.SEQ }" />');">삭제</a></li>
		      </ul>
	      </c:forEach>
	    </div>
	    <div class="grant-btn">
	      <a href="/admin/grant/write.do" class="add-grant">권한 추가</a>
	    </div>
	
	  </div>
  </form>
</body>

</html>