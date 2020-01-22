<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>관리자 페이지-1:1문의</title>
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
						url: "/admin/board/inquiry/write_proc.json",
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
		
		$("#contents").val(wordchk2($("#contents").val()));
		
		if(  returnStr && ($("#contents").val() == null || $("#contents").val() == '')){
			alert('내용을 입력해 주십시요.');
			$('#contents').focus();
			returnStr = false;
		}
		
		return returnStr;	
	}
	
	function warning(){
		alert('이미 답변 완료된 문의입니다.');
	}
  </script>
</head>

<body>
  <div class="section">
    <h2>1:1문의 상세</h2>
    <div class="breadcrumbs">
      <a href="#" class="home"><span>home</span></a>
      <span>게시판관리</span>
      <span>1:1문의</span>
      <span>1:1문의 상세</span>
    </div>
    <div class="section-main">
      <table class="inquiry-table">
        <tr>
          <td class="title">날짜</td>
          <td><fmt:formatDate value="${detail.creation_date}" pattern="yyyy-MM-dd a hh:mm"/></td>
          <td class="title">답변여부</td class="title">
          <td><c:out value='${detail.INQ_YN}'/></td>
        </tr>
        <tr>
          <td class="title">제목</td class="title">
          <td><c:out value='${detail.title}'/></td>
          <td class="title">문의자</td>
          <td><c:out value='${detail.creation_user}'/></td>
        </tr>
        <tr class="content">
          <td colspan="4"><c:out value='${detail.userContent}'/></td>
        </tr>
      </table>
      <h2>1:1문의 답변</h2>
      <form action="" name="frm" id="frm">
      	<input type="hidden" name="answerName" id="answerName" value="<c:out value='${admin.id}'/>">
      	<input type="hidden" name="inqId" id="inqId" value="<c:out value='${detail.seq}'/>">
			<c:choose>
				<c:when test="${empty detail.CONTENTS}">
	   			  <div class="inquiry-answer">
	      		    <textarea name="contents" id="contents" cols="30" rows="10"><c:out value='${detail.CONTENTS}'/></textarea>
	    		  </div>
				</c:when>
				<c:otherwise>
			      <table class="inquiry-table">
			        <tr class="content">
			          <td colspan="4"><c:out value='${detail.CONTENTS}'/></td>
			        </tr>
			      </table>
				</c:otherwise>
			</c:choose>
      </form>
      <div class="inquiry-button">
        <button>문의 완료 메일 발송</button>
			<c:choose>
				<c:when test="${empty detail.CONTENTS}">
					<button onclick="write_proc()">확인</button>
				</c:when>
				<c:otherwise>
					<button onclick="warning()">확인</button>
				</c:otherwise>
			</c:choose>
      </div>
    </div>
  </div>
  <form name="frmParam" id="frmParam" method="post">
	<c:forEach items="${param}" var="pL" varStatus="status">
		<input type="hidden" id="${pL.key }"  name="${pL.key }"  value="<c:out value="${pL.value }"  />" />	
	</c:forEach>
  </form>
</body>

</html>