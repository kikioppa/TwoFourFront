<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>

<head>
	<title>회원가입</title>
	<script src="https://auth.logintalk.io/js/logintalk.js"></script>
	<script type="text/javascript">
	
		function fn_join(){

			if(isValid() && confirm('회원가입 하시겠습니까?')){
				var option = {
					type : "post",
					url: './join_user.json',
					data: $("#frm").serialize() ,
					dataType: 'json',
					beforeSend: function() {
						$('#ajax_load_indicator').show();
					},
					success : function(data) {
						if (data.result == 'success'){
							fn_joinValid();
						}else if(data.result == 'idError'){
							alert('아이디가 존재합니다.');
							$("#memberPw").val('');
							$("#memberPw2").val('');
						}else if(data.result == 'acError'){
							alert('가입된 회원입니다.');	
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


		function isValid(){
			var returnStr = true;
			var id =  $("#memberId").val();
			var phone = $("#memberPhone").val();
			var name = $("#memeberName").val();
			var pw = $("#memberPw").val();
			var pw2 = $("#memberPw2").val();
			var mailYn=$("#mailYn").val();
			var smsYn=$("#smsYn").val();
			var check = $("input:checkbox[id='checkbox']").is(":checked");
			var check1 = $("input:checkbox[id='checkbox1']").is(":checked");
			var check2 = $("input:checkbox[id='checkbox2']").is(":checked");
// 			var getId=RegExp(/^[0-9a-zA-Z]*[@][0-9a-zA-Z]*[.][a-zA-Z]{2,3}$/i);
			var getId=RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
			var getPhone = RegExp(/^\d{3}\d{3,4}\d{4}$/); 
			var getPw = RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
			var num = pw.search(/[0-9]/g); 
			var eng = pw.search(/[a-z]/ig); 
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

			if(  returnStr  &&  trimNvl( $("#memberId").val() )){
				alert('아이디를 입력해 주십시요.');
				$('#memberId').focus();
				returnStr = false;
			}
			
			if(!getId.test(id) && returnStr){
				alert('이메일 형식으로 입력해주세요');
				$('#memberId').focus();
				returnStr = false;
			}
		
			if(  returnStr  &&  trimNvl( $("#memberPw").val() )){
				alert('패스워드를 입력해 주십시요.');
				$('#memberPw').focus();
				returnStr = false;
			}
// 			if(!getPw.test(pw) && returnStr){
// 				alert('비밀번호 규칙에 맞춰 입력해주세요');
// 				$('#memberPw').focus();
// 				returnStr = false;
// 			}
			if (pw.length < 6 || pw.length > 12 && returnStr ) {
				alert("6 ~ 12자리 이내로 입력해주세요.");
				$('#memberPw').focus();
				returnStr = false;
			}
			if( ((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)) && returnStr ){
				alert("영문,숫자,특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
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
			
			if(!getPhone.test(phone) && returnStr){
				alert('- 제외 후 입력해주세요');
				$('#memberPhone').focus();
				returnStr = false;
			}
			
			if(!check && returnStr ){
				alert('14세  미만은 가입이 불가합니다.');
				returnStr =false;
			}
		
			if(!check1 && returnStr ){
				alert('이용약관에 동의해주세요.');
				returnStr =false;
			}
		
			if(!check2 && returnStr ){
				alert('개인정보처리방침에 동의해주세요.');
				returnStr =false;
			}
			
			if($("input:checkbox[name='mailCheckYn']").is(":checked")){
				$("#mailYn").val("Y");
			}else{
				$("#mailYn").val("N");
			}
	
			if($("input:checkbox[name='smsYn']").is(":checked")){
				$("#smsYn").val("Y");
			}else{
				$("#smsYn").val("N");
			}
	
			if(returnStr){
				$("#memberPw").val(CryptoJS.SHA256(pwEncode($('#memberId').val(), $('#memberPw').val())).toString());	
			}
			return returnStr;
				
		}
			
			  
		function go_list(){
			$("#frm").attr("action","login.do")
			$("#frm").submit();
		}
		function fn_joinValid() {

			var options = {
				key : "stMyAHwTh",
				service : 4,
				auto : false,
				verify:true,
				user : $("#memberPhone").val(),
				action : "./join_valid.json"

			};
			logintalk(options);
		
		
		
		
		function cb(token) {

			$("#token").val(token);
			var option = {
					type : "post",
					url: './m/join_valid.json',
					data: $("#frm").serialize() ,
					dataType: 'json',
					beforeSend: function() {
						$('#ajax_load_indicator').show();
					},
					success : function(data) {
						console.log("데이타"+data.result);
						if (data.result == 'success'){
							alert('회원가입이 성공했습니다.');
							$("#frm").attr('action', '/index.do');
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

	<div class="container join">
		<form name="frm" id="frm" method="post">
		<input type="hidden" name="mailYn" id="mailYn" value="" />
		<input type="hidden" name="smsYn" id="smsYn" value="" />
		<input type="hidden" name="memberStat" id="memberStat" value="A" />
		<input type="hidden" name="token" id="token" value="" />
		<section class="input-form">
			<div class="input-text-wrap underline-type prefix-icon">
				<span class="icon-id"></span>
				<input name="memberId" id="memberId" type="text" maxlength="50" placeholder="아이디">
			</div>
			<div class="input-text-wrap underline-type prefix-icon">
				<span class="icon-password"></span>
				<input id="memberPw" name="memberPw" type="password" maxlength="12" placeholder="비밀번호">
			</div>
			<div class="input-text-wrap underline-type prefix-icon">
				<span class="icon-password-check"></span>
				<input id="memberPw2" name="memberPw2" type="password" maxlength="12" placeholder="비밀번호확인">
			</div>
			<div class="input-text-wrap underline-type prefix-icon">
				<span class="icon-name"></span>
				<input name="memberName" id="memberName" type="text" maxlength="10"  placeholder="이름">
			</div>
			<div class="input-text-wrap underline-type prefix-icon">
				<span class="icon-phone"></span>
				<input  name="memberPhone" id="memberPhone" type="tel" maxlength="14" placeholder='휴대폰번호 "-" 제외한 번호입력'>
			</div>

			<div class="border-box">
				<ul>
					<li>
						<span class="checkbox-label">
							<label>
								<span class="checkbox-wrap">
									<input type="checkbox" name="ckbox" id="checkbox">
									<span class="icon"></span>
								</span>만 14세 이상입니다.
							</label>
						</span>
					</li>
					<li>
						<span class="checkbox-label">
							<label>
								<span class="checkbox-wrap">
									<input type="checkbox" name="ckbox1" id="checkbox1">
									<span class="icon"></span>
								</span>이용약관 동의
							</label>
						</span>
						<span class="btn-wrap">
						  <!--modal description : modalOpen('모달id값') -->
						<a href="javascript:void(0)" onclick="modalOpen('#termsOfUse');" class="link-btn-underline">전체보기</a>
						</span>
					</li>
					<li>
						<span class="checkbox-label">
							<label>
								<span class="checkbox-wrap">
									<input type="checkbox" name="ckbox2" id="checkbox2">
									<span class="icon"></span>
								</span>개인정보처리방침
							</label>
						</span>
						<span class="btn-wrap">
						<a href="javascript:void(0)" class="link-btn-underline" onclick="modalOpen('#privacyPolicy');">전체보기</a>
						</span>
					</li>
					<li>
						<span class="checkbox-label">
							<label>
								<span class="checkbox-wrap">
									<input type="checkbox" name="mailCheckYn">
									<span class="icon"></span>
								</span>이메일 마케팅 수신동의
							</label>
						</span>
					</li>
					<li>
						<span class="checkbox-label">
							<label>
								<span class="checkbox-wrap">
									<input type="checkbox" name="smsYn">
									<span class="icon"></span>
								</span>SMS 마케팅 수신동의
							</label>
						</span>
					</li>
    			</ul>
			</div>
	
		</section>
		</form>
		<section class="submit-btn">
			<a href="#" onclick="fn_join()" class="btn primary lg square">회원가입</a>
		</section>
    
	</div>

</body>