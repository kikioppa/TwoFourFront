<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>관리자 페이지-FAQ</title>
  <script>
    function go_paging(page){
    	$("#frm").attr("action" , "list.do");
    	$("#curPage").val(page);
    	$("#frm").submit();
    }
	//리스트 페이지 이동
	function go_list() {
		$("#frmParam").attr("action" , "list.do");
		$("#frmParam").submit();
	}
    function cate_change(seq){
    	$("#frm").attr("action" , "list.do");
    	$("#categorySeq").val(seq);
    	$("#frm").submit();
    }
	
  //체크되어 있는지
    function checkedValid(){
    	var returnStr = true;
    	
    	var checkedCount =  $("input:checkbox[name=seqArray]:checked").length;
    	if ( checkedCount == 0){
    		alert('선택해주세요.');
    		returnStr = false;
    	}
    	
    	return returnStr;
    }
    
	//FAQ 글 삭제
	function del_proc(faqId){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				type : "post",			
				url : "/admin/board/FAQ/del_proc.json",
				dataType : 'json',
				data: $("#delFrm"+faqId).serialize() ,
				success : function(data) {
					if ( data.success){
						alert("정상적으로 삭제하였습니다.");
						go_list();
					}else{
						alert(data.message);
					}
				
				}
			});
		}
	}
    
	//카테고리 삭제
	function cate_del(){
		if(checkedValid() && confirm("삭제하시겠습니까?")){
			$.ajax({
				type : "post",			
				url : "/admin/board/FAQ/cate_del_proc.json",
				dataType : 'json',
				data: $("#frm").serialize() ,
				success : function(data) {
					if ( data.success){
						alert("정상적으로 삭제하였습니다.");
						go_list();
					}else{
						alert(data.message);
					}
				
				}
			});
		}
	}
	
  function cate_write_proc(){
		if (isValid() && confirm("저장하시겠습니까?")){
				var option = {
						type : "post",
						url: "/admin/board/FAQ/cate_write_proc.json",
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

		$("#newCategory").val(wordchk2($("#newCategory").val()));
		
		if(  returnStr && ($("#newCategory").val() == null || $("#newCategory").val() == '')){
			alert('카테고리 이름을 입력해 주십시요.');
			returnStr = false;
		}
		return returnStr;	
	}
  </script>
</head>

<body>
  <div class="section">
    <h2>자주하는질문FAQ</h2>
    <div class="breadcrumbs">
      <a href="#" class="home"><span>home</span></a>
      <span>게시판관리</span>
      <span>자주하는질문(FAQ)</span>
    </div>
    <div class="section-main">
      <div class="section-in sec-question">
		<form action="" name="frm" id="frm">
			<input type="hidden" name="categorySeq" id="categorySeq" value="">
			<input type="hidden" id="curPage" name="curPage" value="" />
	        <ul class="sub-menu">
	          <c:forEach items="${categoryList}" var="list" varStatus="status">
				<c:choose>
					<c:when test="${listHelper.list[0].CATE_SEQ == list.SEQ}">
	          			<li class="sub-list main99 on1">
					</c:when>
					<c:otherwise>
	          			<li class="sub-list main99">
					</c:otherwise>
				</c:choose>
		          <a href="javascript:cate_change(<c:out value='${list.SEQ}'/>)"><c:out value="${list.CATE_NAME}"/></a>
		        </li>
	          </c:forEach>
	        </ul>
	        <div class="button">
	          <button type="button" id="popup_open">카테고리추가</button>
	          <div id="popup_wrap">
	            <div class="popup-cont01">
	              <h3>추가할 카테고리 이름을 적어주세요.</h3>
		                <input type="text" name="newCategory" id="newCategory">
		                <input type="hidden" name="categoryWriter" id="categoryWriter" value="<c:out value='${admin.id}'/>">
	              <div>
	                <button onclick="cate_write_proc()">완료</button>
	                <button id="popup_close">닫기</button>
	              </div>
	            </div>
	          </div>
	          <div id="mask"></div>
	          <button type="button" id="delete">카테고리 삭제</button>
	          <div id="wrap">
	            <div class="cont">
	              <h3>삭제할 카테고리를 선택해주세요.</h3>
	              <ul>
				          <c:forEach items="${categoryList}" var="list" varStatus="status">
			                <li>
			                  <input type="checkbox" name="seqArray" id="chk${status.count}" value="<c:out value='${list.SEQ}'/>">
			                  <p class="kategorie"><c:out value="${list.CATE_NAME}"/></p>
			                </li>
				          </c:forEach>
	              </ul>
	                <button onclick="cate_del()">삭제</button>
	                <button id="close" type="button">닫기</button>
	            </div>
	          </div>
	          <div id="mask2"></div>
	        </div>
          </form>
        <ul class="purchase-list sub99">
          <li class="list-title list">
            <ul>
              <li class="number">번호</li>
              <li class="q center">제목</li>
              <li class="day">등록일</li>
            </ul>
          </li>
	      <c:forEach items="${listHelper.list}" var="list" varStatus="status">
         	<form action="" name="delFrm${list.SEQ}" id="delFrm${list.SEQ}">
			    <input type="hidden" id="faqId" name="faqId" value="${list.SEQ}" />
		          <li class="list">
		            <ul class="main-list main${status.count}">
		              <li class="number"><c:out value="${list.ROWNUM}"/></li>
		              <li class="q"><c:out value="${list.INQUIRY_CONTENTS}"/></li>
		              <li class="day"><fmt:formatDate value="${list.creation_date}" pattern="yyyy-MM-dd a hh:mm"/></li>
		              <li class="down-arrow"></li>
		            </ul>
		            <ul class="sub-list sub${status.count}">
		              <li class="answer"><c:out value="${list.ANSWER_CONTENTS}"/></li>
		              <li><button onclick="del_proc(<c:out value="${list.SEQ}"/>)">삭제</button></li>
		              <li class="up-arrow"></li>
		            </ul>
		          </li>
          	</form>
	     </c:forEach>
      </div>
	  <div class="pageSection ">
		<ndn:paging listHelper="${listHelper}"/>
	  </div>
	  <div class="writing"><a href="/admin/board/FAQ/write.do">자주하는 질문 글쓰기</a></div>
    </div>
  </div>
  <form name="frmParam" id="frmParam" method="post">
	<c:forEach items="${param}" var="pL" varStatus="status">
		<input type="hidden" id="${pL.key }"  name="${pL.key }"  value="<c:out value="${pL.value }"  />" />	
	</c:forEach>
  </form>
</body>

</html>