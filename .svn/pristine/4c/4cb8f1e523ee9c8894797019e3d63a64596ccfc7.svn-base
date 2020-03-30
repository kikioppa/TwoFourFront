<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>

<head>
  <title>1:1 문의</title>
  <script>

    function go_list(){
		$("#frm").attr("action" , "/myPage/question.do");
		$("#frm").submit();
    }
    
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
								go_list();
							}else{
								alert('문의가 실패하였습니다.');
							}
						},
						error: function(request, status, err) {
							alert('오류가 발생 되었습니다.\n계속 발생할경우 관리자에게 문의하십시오.');
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
		
        if($("#contents").val().length > 4000) {
			alert('글자수는 4000자 제한입니다.');
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
      <button type="button" onclick="go_list()">1:1문의 내역보기</button>
      <form action="" id="frm" name="frm" method="post">
      	<input type="hidden" name="memberNo" id="memberNo" value="<c:out value="${memberNo}"/>">
	      <table class="view-table">
	        <tr>
	          <td>제목</td>
	          <td><input type="text" name="title" id="title" maxlength="50" ></td>
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