<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>관리자 페이지-FAQ</title>
  <script type="text/javascript">
	//리스트 페이지 이동
	function go_list() {
		$("#frmParam").attr("action" , "list.do");
		$("#frmParam").submit();
	}
	
	function write_proc(){
		if ( isValid() && confirm("저장하시겠습니까?")){
				var option = {
						type : "post",
						url: "/admin/board/FAQ/write_proc.json",
						data: $("#frm").serialize() ,
						dataType: 'json',
						success : function(data) {
							if(data.success){
								alert('성공하였습니다.');
								go_list();
							}else{
								alert('실패 하였습니다.');
							}
						},
						error: function(request, status, err) {
							//alert('서버와의 통신이 실패했습니다.');
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+err);
						}
					};
					$("#frm").ajaxSubmit(option);
		}
	}
	
	function isValid(){
		var returnStr = true;

		$("#inquiryContent").val(wordchk2($("#inquiryContent").val()));
		$("#ansewrContent").val(wordchk2($("#ansewrContent").val()));
		
		if(  returnStr && ($("#inquiryContent").val() == null || $("#inquiryContent").val() == '') && ($("#ansewrContent").val() == null || $("#ansewrContent").val() == '')){
			alert('질문과 답변을 모두 입력해 주십시요.');
			returnStr = false;
		}
		return returnStr;	
	}
  </script>
</head>

<body>
  <div class="section">
    <h2>자주하는질문FAQ 글쓰기</h2>
    <div class="breadcrumbs">
      <a href="#" class="home"><span>home</span></a>
      <span>게시판관리</span>
      <span>자주하는질문FAQ</span>
      <span>자주하는 질문 글쓰기</span>
    </div>
	<form action="" name="frm" id="frm">
	    <input type="hidden" name="adminName" id="adminName" value="<c:out value='${admin.id}'/>">
		<div class="section-main">
	      <div class="faq-table">
	        <div class="category-box">
	                  카테고리 설정
	          <select name="categorySeq" id="categorySeq">
		          <c:forEach items="${categoryList}" var="category" varStatus="status">
	            	<option value="${category.SEQ}">${category.CATE_NAME}</option>
		          </c:forEach>
	          </select>
	        </div>
	        <table>
	          <tr>
	            <td>질문</td>
	          </tr>
	          <tr class="quertion-title">
	            <td><textarea name="inquiryContent" id="inquiryContent" cols="30" rows="10"></textarea></td>
	          </tr>
	        </table>
	        <table>
	          <tr>
	            <td>답변</td>
	          </tr>
	          <tr>
	            <td><textarea name="ansewrContent" id="ansewrContent" cols="30" rows="10"></textarea></td>
	          </tr>
	        </table>
	      </div>
	      <button class="faq-button" onclick="write_proc()">확인</button>
	    </div>
	</form>
  </div>
  <form name="frmParam" id="frmParam" method="post">
	<c:forEach items="${param}" var="pL" varStatus="status">
		<input type="hidden" id="${pL.key }"  name="${pL.key }"  value="<c:out value="${pL.value }"  />" />	
	</c:forEach>
  </form>
</body>

</html>