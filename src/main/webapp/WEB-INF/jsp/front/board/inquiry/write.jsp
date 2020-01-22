<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>문화 1번가 - 1:1 문의</title>
  <script>

    function write_proc(){
		if ( isValid() && confirm("문의하시겠습니까?")){
				var option = {
						type : "post",
						url: "/board/inquiry/write_proc.json",
						data: $("#frm").serialize() ,
						dataType: 'json',
						success : function(data) {
							if(data.success){
								alert('문의가 접수되었습니다.');
								alert("1:1 문의 내역으로 이동해야 함 (현재는 페이지가 없음)")
								go_list();
							}else{
								alert('문의가 실패하였습니다.');
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

		$("#title").val(wordchk2($("#title").val()));
		$("#contents").val(wordchk2($("#contents").val()));
		
		if(  returnStr  &&  trimNvl( $("#title").val() )){
			alert('제목을 입력해 주십시요');
			$('#title').focus();
			returnStr = false;
		}	
		
		if(  returnStr && trimNvl( $("#contents").val())){
			alert('내용을 입력해 주십시요.');
			$('#contents').focus();
			returnStr = false;
		}

		return returnStr;	
	}
  </script>
</head>

<body>
  <!--section-->
  <div class="section">
    <div class="section-main question-view">
      <h2>1:1 문의</h2>
      <button>1:1문의 내역보기</button>
      <form action="" id="frm" name="frm" method="post">
<!-- 								사용자의 MEMBER_NO를 가져와서 입력 -->
      	<input type="hidden" name="memberName" id="memberName" value="15">
	      <table class="view-table">
<!-- 	        <tr> -->
<!-- 	          <td>분류</td> -->
<!-- 	          <td class="select"> -->
<!-- 	            <select name="" id=""> -->
<!-- 	              <option value="">선택하세요.</option> -->
<!-- 	              <option value="">제목</option> -->
<!-- 	              <option value="">내용</option> -->
<!-- 	            </select> -->
<%-- 	            <div class="select_arrow"><img src="${web_server_url}/images/front/select_arrow.png" alt=""></div> --%>
<!-- 	          </td> -->
<!-- 	        </tr> -->
	        <tr>
	          <td>제목</td>
	          <td><input type="text" name="title" id="title"></td>
	        </tr>
	        <tr>
	          <td>내용</td>
	          <td><textarea name="contents" id="contents" cols="30" rows="10"></textarea></td>
	        </tr>
	      </table>
      </form>
      <div class="ok">
        <button onclick="write_proc()">완료</button>
      </div>
    </div>
  </div>
</body>

</html>