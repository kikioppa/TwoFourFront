<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>

<head>
  <title>1:1 문의</title>
  <script>

    function go_list(){
		$("#frm").attr("action" , "/m/myPage/question.do");
		$("#frm").submit();
    }
    
    function write_proc(){
		if ( isValid() && confirm("문의하시겠습니까?")){
				var option = {
						type : "post",
						url: "./write_proc.json",
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
							//alert('서버와의 통신이 실패했습니다. ');
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
	<div class="container my-question">
		<form id="frm" name="frm" method="post">
		<input type="hidden" name="memberNo" id="memberNo" value="<c:out value="${memberNo}"/>">
		<section>
			<div class="anchor">
			<a href="javascript:go_list();" class="btn text primary sm">
				<span>1:1 문의 내역보기</span>
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
		</section>
		<section class="input-form">
			<!-- <div class="select-wrap">
				<select name="" id="">
					<option value="">분류선택</option>
					<option value="">분류1</option>
					<option value="">분류2</option>
				</select>
			</div> -->
		</section>
		<section class="editor-form">
			<div class="input-text-wrap">
				<input type="text" name="title" id="title" maxlength="50" placeholder="제목을 입력하세요" value="">
			</div>
			<div class="input-text-wrap">
				<textarea name="contents" id="contents"  cols="30" rows="10" placeholder="내용을 입력하세요"></textarea>
			</div>
		</section>
		
		<section class="submit-btn">
			<a href="javascript:write_proc();" class="btn primary lg square">완료</a>
		</section>
		</form>
	</div>

</body>