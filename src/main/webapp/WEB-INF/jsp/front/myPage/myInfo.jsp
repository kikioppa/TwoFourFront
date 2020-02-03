<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>개인정보수정</title>
  <script src="https://auth.logintalk.io/js/logintalk.js"></script>
  <script src="http://malsup.github.com/jquery.form.js"></script> 
  <script>

 function resetPassword(resetPassword){
	 
	if(isValid() && confirm("개인정보를 수정하시겠습니까?")){

	<!-- $("#resetPassword").val(resetPassword); -->
	 $("#memberPw").val(CryptoJS.SHA256(pwEncode($('#memberId').val().trim(), $('#memberPw').val().trim())).toString());	 
	 var option = {
			type : "post",
			url: './resetPassword.json',
			data: $("#frm").serialize() ,
			dataType: 'json',
			beforeSend: function() {
				$('#ajax_load_indicator').show();
			},
			success : function(data) {
				if(data.success){
					alert('성공하였습니다.');
					window.location.reload();
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
 
 function isValid(){
		var returnStr = true;
		var pw = $("#memberPw").val();
		var pw2 = $("#memberPw2").val();
		var phone = $("#memberPhone").val();
		var getPhone = RegExp(/^\d{3}\d{3,4}\d{4}$/); 
		var getPw = RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
		

		if(  returnStr  &&  trimNvl( $("#memberPw").val() )){
			alert('패스워드를 입력해 주십시요.');
			$('#memberPw').focus();
			returnStr = false;
		}
		
		if(!getPw.test(pw) && returnStr){
			alert('비밀번호 규칙에 맞춰 입력해주세요');
			$('#memberPw').focus();
			returnStr = false;
		}
		if( (pw!==pw2) && returnStr){
			alert('비밀번호가 일치하지 않습니다.');
			$('#memberPw2').focus();
			returnStr = false;
		}
		
		if(  returnStr  &&  trimNvl( $("#memberName").val() )){
			alert('이름을 입력해 주십시요.');
			$('#memberName').focus();
			returnStr = false;
		}
		
		if(  returnStr  &&  trimNvl( $("#memberPhone").val() )){
			alert('전화번호를 입력해 주십시요.');
			$('#memberPhone').focus();
			returnStr = false;
		}
		
	<!--	if(!getPhone.test(phone) && returnStr){
			alert('- 제외 후 입력해주세요');
			$('#memberPhone').focus();
			returnStr = false;
		}-->
		
		return returnStr;

	}
 
 </script>

<script>
function fn_delete(){

	if(confirm('회원탈퇴 하시겠습니까?')){
		var option = {
			type : "post",
			url: './delete_user.json',
			data: $("#frm").serialize() ,
			dataType: 'json',
			beforeSend: function() {
				$('#ajax_load_indicator').show();
			},
			success : function(data) {
				if (data.success){
					alert('탈퇴되었습니다.');
					window.location.href="/";
					
				}else{
					alert('오류');
					return ;
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

 <script>
  
	function fn_phoneValid() {

		var options = {
			key : "stMyAHwTh",
			service : 4,
			auto : false,
			verify:true,
			user : $("#memberPhone").val(),
			action : "./user_findPw.json"

		};
		logintalk(options);
		

		function cb(token) {
			console.log("token : " + token);
			$("#token").val(token);
			var option = {
					type : "post",
					url: './user_findPw.json',
					data: $("#frm").serialize() ,
					dataType: 'json',
					beforeSend: function() {
						$('#ajax_load_indicator').show();
					},
					success : function(data) {
						if (data.result == 'success'){
							$("#frm").attr('action', '/front/myPage/myInfo.do');
							$("#frm").submit();
						<!--	window.location.reload(); -->
						}else{
							alert('본인인증 오류가 발생 되었습니다.');
							return ;
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
		logintalk.callback(cb);
	}
		 </script>
  
</head>

<body>
  <form id="frm" name="frm" method="post">
  <input type="hidden" id="seq" name="seq" value="" />
  <div class="section">
    <div class="wrapper">
      <div class="buy-header">
        <h1>개인정보수정</h1>
      </div>
      <div class="user-info">
        <h2>회원정보</h2>
        <table>
          <colgroup>
            <col style="width: 150px;">

          </colgroup>
          <tr class="thead">
            <td>아이디</td>
            <td><input type="text" value="<c:out value="${memberInfo.MEMBER_MAIL_ADDR}"/>"id="memberId" name="memberId" disabled><br></td>
          </tr>				
          <tr>
            <td>이름</td>
            <td><input type="text" value="<c:out value="${memberInfo.MEMBER_NAME}"/>"id="memberName" name="memberName" disabled><br></td>
          </tr>
          <tr>
            <td>새비밀번호</td>
            <td>
            	<input id="memberPw" name="memberPw" type ="password" placeholder="비밀번호를 입력하세요.">
            </td>
          </tr>
          <tr>
            <td>비밀번호 확인</td>
            <td>
            
            	<input id="memberPw2" name = "memberPw2" type="password" placeholder="비밀번호 확인합니다.">
            </td>
          </tr>
          <tr>
            <td>휴대폰 번호</td>
            <td><input type="text" value="${memberInfo.MEMBER_PHONE}" class="phone-number-check"><button type="button"  onclick="fn_phoneValid()">인증하기</button>
            </td>
            <tr class="text-td">
              <td></td>
              <td>
                <p>*비밀번호는 영문/숫자/특수문자/ 3가지 이상 조합해서 최소 6자~12자</p>
                <p>*입력하신 휴대폰번호와 이메일(아이디)로 주요공지사항 및 이벤트에 대한 안내를 받을 수 있습니다.</p>
                <p>*거래정보와 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.</p>
              </td>
            </tr>
            <tr class="agree-select">
              <td>SMS 수신동의</td>
              <td>
                <div class="radio-wrap">
                  <input type="radio" id="smsY" name="smsYn" value="Y" <c:if test="${memberInfo.SMS_YN eq 'Y'}">checked</c:if> >
                  <span class="icon-radio"></span>
                  <label for="radio01">동의함</label>
                </div>
                <div class="radio-wrap">
                  <input type="radio" id="smsN" name="smsYn" value="N" <c:if test="${empty memberInfo.SMS_YN || memberInfo.SMS_YN eq 'N'}">checked</c:if> >
                  <span class="icon-radio"></span>
                  <label for="radio02">동의안함</label>
                </div>
              </td>
            </tr>
            <tr class="agree-select">
              <td>이메일 수신동의</td>
              <td>
                <div class="radio-wrap">
                  <!--선택이 되어있을때-->
                  <input type="radio" id="mailY" name="mailYn" value="Y" <c:if test="${memberInfo.MAIL_YN eq 'Y'}">checked</c:if> >
                  	<!--  cif? when ? -->
                  <span class="icon-radio"></span>
                  <label for="radio03">동의함</label>
                </div>
                <div class="radio-wrap">
                  <input type="radio" id="mailN" name="mailYn" value="N" <c:if test="${empty memberInfo.MAIL_YN || memberInfo.MAIL_YN eq 'N'}">checked</c:if> >
                  <span class="icon-radio"></span>
                  <label for="radio04">동의안함</label>
                </div>
              </td>
            </tr>
        </table>
        <div class="user-info-btn">
        <input type="hidden" id="memberStat"  name="memberStat" value="<c:out value="${memberInfo.MEMBER_STAT}"/>" />
        <input type="hidden" id="memberNO"  name="memberNO" value="<c:out value="${memberInfo.MEMBER_NO}"/>" />
          <button type ="button" onclick="fn_delete()">회원탈퇴</button>
           <button type ="button" onclick="resetPassword('<c:out value="${memberInfo.MEMBER_PASSWORD}"/>')">개인정보 수정</button>
        </div>
      </div>
    </div>
  </div>
  </form>
</body>

</html>