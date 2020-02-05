<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
    
<head>
	<title>아이디 찾기</title>
	<script src="https://auth.logintalk.io/js/logintalk.js"></script>
	<script type="text/javascript">

		function fn_findIde(){
			if(isValid() && confirm('찾으시겠습니까?')){
				$("#memberPhone").val($("#memberPhone").val().replace(/-/gi,''));
				var option = {
					type : "post",
					url: './m/user_findId.json',
					data: $("#frm").serialize() ,
					dataType: 'json',
					beforeSend: function() {
						$('#ajax_load_indicator').show();
					},
					success : function(data) {
						if (data.result == 'success'){
							console.log("콘솔로그");
							fn_findId();
						}else if(data.result == 'idError'){
							alert('없는 번호입니다.');
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
		  	var phone = $("#memberPhone").val();
			var getPhone = RegExp(/^\d{3}\d{3,4}\d{4}$/); 
		  
			if(  returnStr  &&  trimNvl( $("#memberPhone").val() )){
				alert('전화번호를 입력해 주십시요.');
				$('#memberPhone').focus();
				returnStr = false;
			
	  		}
			return returnStr;
		}
  	
		function fn_findId() {

			var options = {
				key : "stMyAHwTh",
				service : 4,
				auto : false,
				verify:true,
				user : $("#memberPhone").val(),
				action : "./m/member/founid.do"
			
			};
			logintalk(options);
		
			function cb(token) {
				$("#token").val(token);
				$("#frm").attr('action', '/m/member/foundid.do');
				$("#frm").submit();
			}
			logintalk.callback(cb);
		}
 	</script>

</head>

<body>

	<div class="container join">
		<section class="tab-wrap tab-paging">
			<div class="tab-index">
				<ul>
					<li class="on">
						<a href="" class="item">아이디 찾기</a>
					</li>
					<li>
						<a href="${web_ssl_url}/m/member/findPw.do" class="item">비밀번호 찾기</a>
					</li>
				</ul>
			</div>
		</section>
		<div class="tab-content">
		<form name="frm" id="frm" method="post">
		<input type="hidden" name="token" id="token" value="" />
			<ul>
				<li>
					<section class="input-form for-id">
						<div class="message-center narrow">
						회원가입시 인증받은 휴대폰 번호를 입력해 주세요. 회원가입시 본인인증에 사용한 <em>"로그인톡"</em>으로 메시지가 전달됩니다.
						</div>
						<div class="input-text-wrap underline-type prefix-icon">
							<span class="icon-phone"></span>
							<input type="tel" placeholder='휴대폰번호 "-" 제외한 번호입력' maxlength="14" name="memberPhone" id="memberPhone" value="">
						</div>
      
						<div class="btn-wrap">
						<a href="" onclick="fn_findIde()" class="btn primary lg square">아이디 찾기</a>
						</div>
					</section>
				</li>
				<li style="display: none;">
					<section class="input-form for-password">
						<div class="message-center narrow">
							아이디, 휴대폰번호, 가입자 이름으로 비밀번호를 새로 설정할 수 있습니다. <em>"로그인톡"</em>으로 메시지가 전달됩니다.
						</div>
						<div class="input-text-wrap underline-type prefix-icon">
							<span class="icon-id"></span>
							<input type="text" placeholder="아이디" value="">
						</div>
						<div class="input-text-wrap underline-type prefix-icon">
							<span class="icon-name"></span>
							<input type="text" placeholder="이름" value="">
						</div>
						<div class="input-text-wrap underline-type prefix-icon">
							<span class="icon-phone"></span>
							<input type="tel" placeholder='휴대폰번호 "-" 제외한 번호입력' value="">
						</div>
	      
						<div class="btn-wrap">
							<a href="" class="btn primary lg square">비밀번호 재설정</a>
						</div>
					</section>
				</li>
			</ul>
		</form>
		</div>
    
	</div>

</body>

