<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>
<head>
	<title>계좌인증</title>
	<script>
	$(function(){

		$("#pw").on('keypress', function(e) {
			if (e.which == 13) {/* 13 == enter key@ascii */
				verifi_check();
			}
		});
		
	});
		function verifi_check(){
			if ( isValid() ){
				$.ajax({
					url: 'verifi_check.json',
					type: 'post',
					data: $("#frm").serialize() ,
					success : function(data) {
						if(data.success){
							$("#verifi").val(data.result);
							go_account();
						}else{
							alert('비밀번호를 확인해주세요.');
						}
					},    		
	 			})	
			}
		}
		
		function isValid(){
			var returnStr = true;

			
			if(  returnStr  &&  trimNvl( $("#pw").val() )){
				alert('비밀번호를 입력해주세요.');
				$('#pwd').focus();
				returnStr = false;
			}	
			
			return returnStr;	
		}
		
		function go_account(){
			$("#frm").attr("action" , "account.do");
			$("#frm").submit();
		}		
	</script>
</head>

<body>


  <div class="section">
    <div class="wrapper">
      <div class="buy-header">
        <h1>마이페이지</h1>
      </div>

      <ul class="mypage-tab">
        <li class="list1"><a href="${web_server_url}/myPage/purchaseList.do">매입신청내역</a></li>
<%--         <li class="list2 on"><a href="${web_server_url}/myPage/accountVerifi.do">계좌인증</a></li> --%>
        <li class="list3"><a href="${web_server_url}/myPage/limit.do">매입한도</a></li>
        <li class="list4"><a href="${web_server_url}/myPage/question.do">1:1문의</a></li>
        <li class="list5"><a href="${web_server_url}/myPage/myInfoCheck.do">개인정보수정</a></li>
      </ul>
      
	<form name="frm" id="frm" method="post">
	<input type="hidden" name="id" id="id" value="<c:out value="${user.id}"/>"/>
	<input type="hidden" name="verifi" id="verifi" />
      <div class="change-info">
        <p>고객님의 계좌정보를 확인/변경하는 페이지입니다.</p>
        <div class="pw-info">
          <input type="password" placeholder="비밀번호" name="pw" id="pw">
          <button type="button" onclick="verifi_check()" class="red-btn">확인</button>
        </div>
      </div>
    </form>
    </div>
  </div>
</body>
