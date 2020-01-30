<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <title>문화 1번가 - 회원가입</title>
    <script src="https://auth.logintalk.io/js/logintalk.js"></script>
	<script type="text/javascript">
	function fn_test2(){
		console.log('테스트입디나다122');
	}
	
	
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
					fn_test();
				}else if(data.result == 'idError'){
					alert('중복아이디.');			
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
					var getId=RegExp(/^[0-9a-zA-Z]*[@][0-9a-zA-Z]*[.][a-zA-Z]{2,3}$/i);
					var getPhone = RegExp(/^\d{3}\d{3,4}\d{4}$/); 
					var getPw = RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
					
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
					
					if($("input:checkbox[id='mailCheckYn']").is(":checked")){
						$("#mailYn").val("Y");
					}else{
						$("#mailYn").val("N");
					}
	
					if($("input:checkbox[id='smsYn']").is(":checked")){
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
</script>

<script>

	function fn_test() {

		var options = {
			key : "stMyAHwTh",
			service : 4,
			auto : false,
			verify:true,
			user : $("#memberPhone").val(),
			action : "./test2.do"

		};
		logintalk(options);
		

		function cb(token) {
			console.log("token : " + token);
			$("#token").val(token);
			$("#frm").attr('action', '/test2.do');
			$("#frm").submit();
		}
		logintalk.callback(cb);
	}
		 </script>
  








</head>

<body>
 <!--section-->
   <form name="frm" id="frm" method="post">
  	  	<input type="hidden" name="mailYn" id="mailYn" value="" />
  	  	<input type="hidden" name="smsYn" id="smsYn" value="" />
  		<input type="hidden" name="memberStat" id="memberStat" value="A" />
  		<input type="hidden" name="token" id="token" value="" />
		<!-- <input type="text" name="tel" id="tel" value="01044951809" /> -->
		
  	  
  <div class="section">
    <div class="section-main join_pg">
      <h2>회원가입</h2>
      <div class="matters-text">
        <div class="matters-img">
          <img src="${web_server_url}/images/front/speaker.png" alt="확성기 이미지">
        </div>
        <div>
          <h4>회원가입전 필독사항</h4>
          <ol>
            <li>아이디(이메일)는 실제 사용하고 있는 메일주소를 입력하시기 바랍니다.</li>
            <li>입금처리시 이메일로 입금처리 내역이 발송됩니다.</li>
            <li>비밀번호는 영문/숫자/특수문자 3가지 이상조합해서 최소 6자 ~ 12자로 설정해주셔야 합니다.</li>
            <li>휴대폰 인증은 본인명의의 휴대폰으로만 인증가능합니다.(14세 미만 가입불가)</li>
            <li>인증관련 문제시 고객센터 1:1문의 또는 help@xxx.xxx 으로 문의해주시기 바랍니다.</li>
          </ol>
        </div>
      </div>
      <div class="join-form">
        <h3>회원정보</h3>
  
          <table>
            <tr>
              <td>아이디</td>
              <td>
                <input name="memberId" id="memberId" type="text"  placeholder="아이디(이메일)를 입력하세요.">
              </td>
            </tr>
            <tr>
              <td>비밀번호</td>
              <td>
                <input id="memberPw" name="memberPw" type ="password" placeholder="비밀번호를 입력하세요.">
              </td>
            </tr>
            <tr>
              <td>비밀번호 확인</td>
              <td><input id="memberPw2" name = "memberPw2" type="password" placeholder="비밀번호 확인합니다.">
                <p>*비밀번호는 영문/숫자/특수문자 3가지 이상 조합해서 최소 6자~12자</p>
              </td>
            </tr>
            <tr>
              <td>이름</td>
              <td>
                <input name="memberName" id="memberName" type="text" placeholder="가입자 이름을 입력하세요.">
              </td>
            </tr>
            <tr>
              <td>휴대폰</td>
              <td>
                <input name="memberPhone" id="memberPhone" type="text" placeholder="휴대폰번호 “-” 제외 후 입력하세요.">
              </td>
            </tr>
          </table>
      </div>
      <div class="join-check">
        <p>이용약관및<br>개인정보처리방침</p>
        <ul>
          <li>
            <input type="checkbox" id="checkbox">
            <label for="checkbox" onclick="check(this)"><img src="${web_server_url}/images/front/ck-icon2.png" alt="빈체크 이미지"></label> 만 14세 이상입니다.
          </li>
          <li>
            <div class="check">
              <input type="checkbox" name="ckbox1" id="checkbox1">
              <label for="checkbox1" onclick="check(this)"><img src="${web_server_url}/images/front/ck-icon2.png" alt="빈체크 이미지"></label> 이용약관 동의
              <button class="agree" type="button" onclick="pop()">내용보기</button>
              <div class="popup">
                <div class="pop_title">
                  이용약관
                  <button href="javascript:;" type="button" onclick="close1('popup','popback')">X</button>
                </div>
                <div class="pop_text">
                  제1조(목적)<br> 이 약관은 (주)피니(이하 "회사"라 함)이 운영하는 인터넷사이트(이하 "사이트"라 함)를 통하여 제공하는 전자상거래 서비스(이하 "서비스"라 함)와 관련하여 "회사"와 "회원"(제2조에 정합니다)의 권리와 의무, 책임사항 및 "회원"의 "서비스" 이용절차에 관한 사항을 규정함을 목적으로 합니다. 이 약관은 PC 통신, 스마트폰(안드로이드폰, 아이폰 등) 앱, 무선 등을 이용하는 전자상거래에
                  대해서도 그 성질에 반하지 않는 한 준용됩니다.<br>
                  <br> 제2조(용어의 정의)<br> ① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br> 1. "회사"가 운영하는 "사이트"(2018. 06. 현재)는 아래와 같습니다.<br> - www.livecon.co.kr<br> - 추후 "회사"에서 공지하고 제공하는 기타 웹사이트<br> 2. "서비스" : "사이트"에서 "회사"가 지정한 종류의 상품권을 회원으로부터 회사가 매입하고, 매입대금을 지불하는 서비스를
                  말합니다.
                  <br> 3. "회원" : "회사"에 개인정보를 제공하여 회원등록을 한 자로서, 이 약관에 약관에 동의하고 아이디를 부여받은 자를 말합니다.<br> 4. "상품권" : "회사"가 지정한 온라인 상품권으로서 "회사"의 정책에 따라 그 종류와 범위에 변동이 있을 수 있으며, 2018년 05월 현재 아래와 같습니다.<br> -발행처/상품권명 : (주)한국문화진흥 / 문화상품권(온라인문화상품권)<br> 5. "아이디(ID)"
                  : "회원"의 "서비스" 이용과 식별을 위해 "회원"이 지정하고, "회사"가 승인한 문자와 숫자의 조합을 뜻합니다.<br> 6. "비밀번호(PASSWORD)" : "회원" 스스로가 설정하여 "서비스"이용을 위해 "사이트"에 등록한 영문 소문자, 숫자, 특수문자의 조합을 뜻합니다.<br> 7. "수수료" : "회원"이 "서비스"를 통해 "상품권"의 매입을 요청 시, "회사"가 "서비스" 제공을 위해 취하는 수수료를
                  뜻합니다.
                  <br> ② 이 약관에서 정의되지 않은 용어는 관련법령이 정하는 바에 따릅니다.<br>
                  <br> 제3조(약관 등의 명시와 설명 및 개정)<br> ① "회사"는 이 약관의 내용과 상호 및 대표자의 성명, 영업소 소재지, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등), 통신판매업 신고번호, 개인정보관리책임자 등을 "회원"이 쉽게 알 수 있도록 "사이트"의 초기 "서비스" 화면(전면)에 게시합니다. 다만, 이 약관의 구체적 내용은 "회원"이 연결화면을 통하여 볼 수 있도록 합니다.<br> ② "회사"는
                  약관의 규제에 관한 법률, 전자문서 및 전자거래기본법, 전자금융거래법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전자상거래 등에서의 소비자보호에 관한 법률, 소비자기본법 등에 관한 법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br> ③ "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 "사이트" 내 공지사항에 최소 그 적용일자 7일
                  이전부터 적용일자 전일까지 공지합니다. 단, 이용자에게 불리하게 약관의 내용을 변경하는 경우에는 적용일자 30일 이전부터 공지합니다.<br> ④ 제3항에 따라 공지된 적용일자 이후에 "회원"이 "회사"의 "서비스"를 계속 이용하는 경우에는 개정된 약관에 동의하는 것으로 봅니다. 개정된 약관에 동의하지 아니하는 "회원"은 언제든지 자유롭게 "서비스" 이용계약을 해지할 수 있습니다. 유료 "서비스"를 이용하는 "회원"이
                  약관의 개정에 동의하지 아니하여 해지할 경우 "회사"가 정한 환불정책에 따릅니다.<br> ⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 일반 상관례에 따릅니다.<br>
                  <br> 제4조(이용계약의 성립)<br> ① 이용계약은 "회원"의 약관 동의, 이용신청에 대한 "회사"의 승낙에 의하여 성립합니다.<br> ② 이용계약은 관련법령에 의거 만14세 미만의 회원가입이 제한될 수 있습니다.<br>
                  <br> 제5조(이용신청 및 승낙)<br> ① "회원"은 "회사"가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.<br> ② "회사"는 전 항에 따른 이용신청 시 "회원"에게 전문기관을 통한 본인인증 절차를 요청할 수 있습니다.<br> ③ "회사"는 다음 각 호에 해당하는 이용신청에 대하여는 이를 승낙하지 아니하거나 사후에 이용계약을 해지할 수 있습니다.<br>                  1. 실명확인절차에서 "회원"의 실명이 아님이 확인된 경우<br> 2. 이미 가입된 "회원"의 e-mail 주소 등의 정보가 동일한 경우<br> 3. 타인의 명의를 도용하거나, 기입내용에 허위, 기재누락, 오기가 있는 경우<br> 4. 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 다만, "회사"의 "회원" 재가입 승낙을 얻은 경우에는 예외로 합니다.<br> 5. 관련법령에 위배되거나 사회의 안녕질서
                  혹은 미풍양속을 저해할 수 있는 목적으로 신청한 경우<br> 6. 부정한 용도 또는 영리를 추구할 목적으로 "서비스"를 이용하고자 하는 경우<br> 7. 이전에 동일∙유사한 아이디 또는 다른 아이디를 통하여 부정한 사용을 한 이력이 있거나 의심되는 경우<br> 8. 관련법령에 위배되거나 사회의 안녕질서 혹은 미풍양속을 저해할 수 있는 목적으로 신청한 경우<br> 9. 기타 이 약관에 위배되거나 위법 또는 부당한 이용신청임이
                  확인된 경우 및 "회사"가 합리적인 판단에 의하여 필요하다고 인정하는 경우<br> 10. 기 가입하였던 e-mail 주소로 가입을 시도하는 경우<br> ④ "회사"는 "서비스" 운영에 따른 관련 제반 설비에 여유가 없거나 기술상 장애 사유가 있는 경우, 그 사유가 해소될 때까지 이용계약 성립을 유보할 수 있습니다.<br> ⑤ "회원"은 가입신청 시 작성한 이용신청 사항에 변경이 있는 경우 "사이트"에서 온라인으로
                  개인정보를 수정하거나 전자우편 기타방법으로 "회사"에 대하여 그 변경 사항을 알려야 합니다. 이를 알리지 않아 발생하는 불이익에 대한 책임은 "회원"에게 있습니다.<br>
                  <br> 제6조(서비스 이용시간)<br> "서비스"의 이용은 "회사"의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기 점검 등의 필요로 "회사"가 정한 날이나 시간은 제외됩니다. 이러한 경우 "회사"는 사전에 이를 공지하며, 부득이한 경우 사후 통보를 할 수 있습니다.<br>
                  <br> 제7조(회원의 아이디 및 비밀번호에 대한 의무)<br> ① "아이디"및 "비밀번호"의 관리책임은 "회원"에게 있으며, 이를 소홀히 하여 발생한 모든 민형사상의 책임은 "회원" 자신에게 있습니다.<br> ② "회원"은 자신의 "아이디"및 "비밀번호"를 제3자가 이용하게 해서는 안됩니다.<br> ③ "회원"이 자신의 "아이디"및 "비밀번호"를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 "회사"에
                  통보하고 "회사"의 조치가 있는 경우에는 그에 따라야 합니다.<br> ④ "회원"이 전 항에 따른 통지를 하지 않거나 "회사"의 조치에 응하지 아니하여 발생하는 모든 불이익에 대한 책임은 "회원"에게 있습니다.<br>
                  <br> 제8조(회원의 의무)<br> ① "회원"은 "서비스" 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.<br> 1. "서비스" 이용 시 허위내용의 등록<br> 2. "회사"가 게시한 정보의 허가 받지 않은 변경<br> 3. "회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시<br> 4. "회사" 및 기타 제3자의 저작권 등 지식 재산권에 대한 침해<br> 5. "회사" 및 기타
                  제3자의 명예를 손상시키거나 업무를 방해하는 행위<br> 6. 외설 또는 폭력적인 메시지, 동영상, 음성 기타 공공질서, 미풍양속에 반하는 정보를 "사이트"에 공개 또는 게시하는 행위<br> 7. "회원"의 의무 불이행<br> 8. 서비스 운영을 고의로 방해하거나 서비스의 안정적 운영을 방해할 수 있는 정보 및 수신자의 명시적인 수신거부의사에 반하여 광고성 정보를 전송하는 행위<br> 9. 기타 관련법령이나 "회사"에서
                  정한 규정에 위배되는 행위<br> ② "회원"은 관계법령, 이 약관의 규정, 이용안내 등 "회사"가 통지하는 사항을 준수하여야 하며, 기타 "회사" 업무에 방해되는 행위를 하여서는 안됩니다.<br>
                  <br> 제9조(회사의 의무)<br> ① "회사"는 관련법령과 이 약관이 금지하거나 공공질서, 미풍양속에 반하는 행위를 하지 않으며, 이 약관이 정하는 바에 따라 지속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여야 합니다.<br> ② "회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 "회원"의 개인정보보호를 위한 보안 시스템을 갖추어야 하며 개인정보취급방침을 공시하고 준수합니다.<br>
                  <br> 제10조 (상품권 매입거래)<br> ① "회원"은 "사이트" 상에서 다음의 방법으로 매입거래를 신청합니다.<br> 1. 회원가입 및 본인 계좌 인증 완료<br> 2. 본인 소유의 올바른 "상품권" 핀번호의 입력<br> 3. 약관, 개인정보취급방침, 개인정보 제3자 정보제공, 매입서비스 이용조건 및 매입진행 내용에 대한 확인 및 동의<br> 4. 매입 "수수료", 입금금액 등 비용에 대한 내용 확인<br>                  5. 최종 동의 및 매입 신청
                  <br> ② "회사"는 "회원"이 매입신청을 함에 있어 다음의 각 내용을 알기 쉽게 제공하여야 합니다.<br> 1. 본 이용약관, 개인정보취급방침, 개인정보 제3자 정보제공, 매입서비스 이용조건 및 매입진행 내용<br> 2. 매입수수료 및 입금 금액 등 비용에 대한 내용<br> 3. 매입거래 내역<br> ③ "회사"는 "회원"의 매입요청에 대해 다음의 방법으로 거래를 진행합니다.<br> 1. "회원"이 요청한 "상품권"
                  핀번호의 사용여부 확인
                  <br> 2. 미사용 "상품권" 핀번호의 액면가 및 매입수수료 안내<br> 3. "회원" 동의 시 미사용 "상품권" 핀번호 매입처리 및 "회원"이 인증한 계좌로의 실시간 입금처리<br> ④ "회사"는 안전한 매입거래 등의 안정적 "서비스" 제공을 위해 "회원"별 매입한도 금액 정책을 시행합니다. 매입한도 정책은 "회사"에서 정의한 규칙에 따르며, "회사"의 사정에 따라 변경될 수 있으며, "회사"는 "사이트"를 통해
                  변경 내용을 고지합니다.<br> ⑤ "회사"가 제3자에게 구매자 개인정보를 제공∙위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 "회사"는 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유∙이용 기간 등을 구매자에게 명시하여야 합니다. 다만, 정보통신망이용촉진 및 정보보호 등에 관한 법률 제25조 제1항에
                  의한 개인정보 취급위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.<br>
                  <br> 제11조 (수수료)<br> ① "수수료" 정책은 "회사"에서 정의한 규칙에 따르며, "회원"은 "서비스" 이용에 대한 "수수료"를 부담해야 합니다.<br> ② "수수료" 정책은 "회사"의 사정에 따라 변경될 수 있으며, "회사"는 "사이트"를 통해 변경 내용을 고지합니다.<br>
                  <br> 제12조 (거래내역)<br> ① "상품권" 매입 거래 내역은 "회원"이 "사이트" 로그인 후 개별 확인 할 수 있습니다.<br> ② "회원"의 고의 또는 과실로 인해 거래내역이 노출되어 발생하는 모든 문제에 대한 책임은 "회원" 본인에게 있으며, "회사"는 책임이 없습니다.<br>
                  <br> 제13조 (부정이용 금지)<br> ① "회사"는 다음 각 호에 해당하는 경우 부정이용으로 판단합니다.<br> 1. "상품권" 발행사에서 정상 발행된 핀번호가 아닌, 비정상적인 방식(불법프로그램, 임의생성 등)으로 생성된 핀번호로 거래를 시도하는 행위<br> 2. "회원" 본인이 정상적인 방법으로 보유하지 않고, 비정상적 또는 불법적인 방식으로 취득한 핀번호로 거래를 시도하는 행위<br> 3. 매입거래가 완료되었거나
                  이미 사용된 핀번호의 유통 또는 매입을 시도하는 행위<br> 4. "회사"가 제공하는 "사이트"에서 비정상적인 방식으로 핀번호의 판매나 매입을 시도하는 행위<br> 5. "회원" 자신의 계정 정보 등 "회사"가 제공하는 "서비스"를 타인에게 판매, 대여, 양도하는 행위 및 이를 홍보하는 행위<br>
                  <br> 제14조(매입거래의 취소 및 환불)<br> ① "회사"의 취소 및 청약철회 규정은 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령을 준수합니다.<br> ② "회사"가 매입한 "상품권" 핀번호는 매입과 동시에 사용완료 처리되므로, 매입된 "상품권"의 핀번호는 취소 또는 환불되지 않습니다. 다만 "회사"는 아래 각 호에 해당하는 경우, 3항의 방법으로 "회원"의 요청 또는 "회사"의 확인을 통해 요청된
                  매입거래의 취소 또는 환불을 진행할 수 있습니다.<br> 1. "상품권" 매입 시 시스템적 장애 또는 Network 문제로 인해 "상품권" 핀번호 매입만 수행되고 거래금액이 "회원"의 계좌에 입금처리 되지 않은 경우<br> 2. "상품권" 발행사의 장애 또는 시스템적 오류로 인해 "상품권" 핀번호 매입이 정상 수행되지 않고, 사용처리가 된 경우<br> ③ "회사" 2항의 각 호에 해당하는 경우, 매입요청된 "상품권"
                  핀번호의 반환이 아닌, 매입거래 금액 기준으로 "회원"에게 현금으로 환불을 수행합니다.<br> ④ 미성년자 또는 미성년자의 법정대리인은 미성년자의 구매를 취소할 수 있으며 구체적인 내용은 민법 상 미성년자의 법률행위 취소 규정에 따릅니다.<br> ⑤ "회원"이 타인의 명의 또는 계좌를 도용하는 등 본 약관에서 금지하는 부정한 방법으로 부당한 이익을 편취하였다고 의심되는 경우, "회사"는 "회원"의 거래를 취소처리하거나
                  제한할 수 있으며, "회원"이 충분한 소명자료를 제공하기 전까지 환불 및 거래 전체를 보류할 수 있습니다.<br> ⑥ 기타 이 약관 및 "사이트"의 이용안내에 규정되지 않은 취소 및 환불에 대한 사항에 대해서는 소비자 피해보상 규정에서 정한 바에 따릅니다.<br>
                  <br> 제15조(정보의 제공)<br> ① "회사"는 "서비스" 이용에 관한 다양한 정보를 전자우편 또는 서신우편, SMS 등의 방법으로 "회원"에게 제공할 수 있으며 "회원"은 수신을 거부할 수 있습니다. 다만 "회사"는 "서비스" 이용에 필수적으로 요구되는 정보(예: 관련 규정/정책의 변경 등)에 대해서는 "회원"의 수신거부의사와 무관하게 이를 제공할 수 있습니다.<br> ② "회사"는 전항에 따른 정보의 제공
                  이외에도 "회원"이 "회사"가 정한 양식에 따라 회원가입 시, "서비스" 이용 시 또는 구매신청 완료 후 기입한 회원정보에 대한 개별 "서비스"를 제공할 수 있습니다.<br>
                  <br> 제16조(회원에 대한 통지)<br> ① "회사"가 "회원"에 대한 통지를 하는 경우, "회원"이 가입신청 시 "회사"에 제출한 전자우편 주소나 SMS 등으로 할 수 있습니다.<br> ② "회사"가 불특정다수의 "회원"에게 통지하는 경우, 1주일 이상 "사이트"에 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, "회원" 본인의 거래에 관하여 중대한 영향을 미치는 사항에 대하여는 개별 통지합니다.<br>
                  <br> 제17조(게시물의 관리)<br> ① "회원"이 작성한 게시물에 대한 모든 권리와 책임은 이를 게시한 "회원"에게 있으며, "회사"는 "회원"이 작성한 게시물이 다음 각 호에 해당하는 경우 "회사"의 정책에 따라 사전 통지 없이 해당 게시물을 삭제하거나, 열람을 제한하는 등의 조치를 취할 수 있습니다.<br> 1. 타인의 권리나 명예, 신용 기타 정당한 이익을 침해하거나 심한 모욕을 주는 경우<br> 2.
                  공공질서 및 미풍양속에 위반되는 내용일 경우<br> 3. 범죄행위와 관련된 내용을 포함하는 경우<br> 4. "회사"의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우<br> 5. 불법물, 음란물 또는 청소년유해매체물의 게시, 광고, 사이트를 링크하는 경우<br> 6. "회사"로부터 사전 승인 받지 아니한 상업광고, 판촉 내용을 게시하거나 타 사이트의 링크를 게시하는 경우<br> 7. "서비스"와 관련
                  없는 내용일 경우<br> 8. "회사"가 제공하는 "서비스" 기타 영업행위의 원활한 진행을 방해하는 것으로 판단되는 경우<br> 9. 기타 이 약관 또는 관련법령에 위반된다고 판단되는 경우<br> ② 본 조 제1항에 해당하는 게시물로 인하여 법률상 이익이 침해된 자는 관련 법령이 정한 절차에 따라 "회사"에 해당 게시물의 게시중단 및 삭제 등을 요청할 수 있으며, "회사"는 관련 법령 및 회사의 정책에 따라 조치를
                  취하여야 합니다.<br> ③ "회원" 탈퇴 이후에는 회원 정보가 삭제되어 작성자 본인을 확인할 수 없으므로 "회원"이 탈퇴이전에 작성한 게시물의 편집이나 삭제가 불가하며, "회원"은 본인이 작성한 게시물의 삭제 또는 게시 중단 등을 원할 경우 "회원" 탈퇴이전에 본인이 작성한 게시물에 대해 삭제 등 조치를 취하여야 합니다.<br>
                  <br> 제18조(이용제한 등)<br> ① "회사"는 "회원"이 다음 각 호의 사유에 해당하는 경우 경고, 일시정지, 영구이용정지 등으로 "서비스"의 이용을 제한할 수 있습니다.<br> 1. 가입 신청 시에 허위 내용을 등록한 경우<br> 2. 타인의 "서비스" 이용을 방해하거나 정보를 도용하는 등 전자상거래질서를 위협하는 경우<br> 4. "회사"를 이용하여 법령과 이 약관이 금지하거나 공공질서, 미풍양속에 반하는
                  행위를 하는 경우<br> 5. "회원"이 "사이트"를 통하여 "상품권"을 매입 요청 시, 잘못된 핀번호나 본인 소유가 아닌 핀번호로 매입을 요청하는 경우<br> 6. "회원"이 "사이트"를 통하여 판매완료 한 "상품권" 핀번호를 부정한 경로로 유통 시키거나 그 시도를 한 경우<br> 7. “회원”이 1개 또는 복수의 ID로 결제수단, 접근매체 또는 기타 “회사”가 제공한 혜택 등을 이용하여 부당한 이득을 취하고자
                  하는 경우<br> 8. “회원"이 주민등록법을 위반한 명의도용 및 매입 요청도용, 저작권법 및 정보통신망 이용촉진 및 정보보호 등에 관한 법률을 위반한 불법통신 및 해킹, 악성프로그램의 배포 등과 같이 관련 법령을 위반한 경우<br> ② 영구이용정지 시 "회사"가 "회원"에게 부여한 모든 혜택은 소멸되며, "회사"는 이를 별도로 보상하지 않습니다. 단, 환불 처리가 필요한 경우 "회사"의 환불규정에 의하되, “회원”이
                  부당하게 취한 이득 또는 혜택은 회수되거나 “회원은” “회사”가 정한 방법에 따라 이를 반환하여야 합니다.<br> ③ 일시정지 시 완료되지 않은 "회원"의 매입요청 등의 요청이 있는 경우, "회사"는 이를 임의로 중지 또는 취소할 수 있으며, 중지 또는 취소한 경우, "회원"에게 가능한 수단을 사용하여 이를 통보합니다. 요청의 중지 또는 취소에 따른 "회원"의 손해에 대해서는 "회사"는 이를 별도로 보상하지 않습니다.<br>                  ④ 본 조에 따라 "서비스" 이용을 제한하는 경우 "회원"에게 이를 "회원"이 등록한 전자우편 또는 전화, 기타의 방법을 통하여 통지하고, 회원등록 말소 전에 소명할 기회를 부여할 수 있습니다.<br> ⑤ "회사"는 "회원"에 대하여 영화 및 비디오물의 진흥에 관한 법률 및 청소년 보호법 등에 따라 "서비스" 의 이용을 제한할 수 있습니다.<br> ⑥ "회사"는 "회원"이 주민등록법, 저작권법 또는 정보통신망 이용촉진
                  및 정보보호 등에 관한 법률 등 대한민국 내 제반 법령을 위반한 것으로 의심이 되는 경우 "회원"에게 통지 후 "서비스" 이용을 제한하고 수사기관을 통하여 사실관계를 규명할 수 있습니다.<br>
                  <br> 제19조(서비스 제공의 중지)<br> ① "회사"는 다음 각 호에 해당하는 경우 "서비스" 제공을 중지할 수 있습니다.<br> 1. "서비스" 이용 설비의 보수 등 공사로 인한 부득이한 경우<br> 2. 전기통신사업법에 규정된 기간통신사업자가 전기통신 "서비스"를 중지했을 경우<br> 3. 기타 불가항력적 사유가 있는 경우<br> ② "회사"는 국가비상사태, 정전, "서비스" 설비의 장애 또는 "서비스"
                  이용의 폭주 등으로 정상적인 "서비스" 이용에 지장이 있는 때에는 "서비스"의 전부 또는 일부를 제한하거나 정지할 수 있습니다.<br>
                  <br> 제20조(이용계약의 해지 및 종료)<br> ① 회원의 해지<br> 1. "회원"은 언제든지 "사이트" 내 마이페이지 탭을 통하여 이용계약을 해지할 수 있습니다.<br> 2. 전 항에 따라 해지를 한 "회원"은 "회사"가 정하는 규정에 따라 "회원"으로 다시 가입할 수 있습니다.<br> ② 회사의 해지<br> 1. "회사"는 "회원"에게 다음과 같은 사유가 있는 경우 이용계약을 해지할 수 있고, 해당 "회원"에
                  대한 정보의 보유는 개인정보취급방침에 따릅니다.<br> 가. 제5조 제3항의 승낙거부사유가 있음이 확인된 경우<br> 나. "회사"나 다른 "회원" 기타 타인의 권리나 명예, 신용 기타 정당한 이익을 침해하거나 대한민국 법령 또는 공서양속에 위배되는 행위를 한 경우<br> 다. "회사"가 제공하는 "서비스" 등에 대해 확인되지 않는 사실로 불신을 조장하는 행위를 한 경우<br> 라. "회사"가 제공하는 "서비스"의
                  원활한 진행을 방해하는 행위를 하거나 시도한 경우
                  <br> 마. 기타 "회사"가 합리적인 판단에 기하여 "서비스"의 제공을 거부할 필요가 있다고 인정할 경우<br> 2. 이용계약은 "회사"가 해지의사를 "회원"에게 통지한 시점에 종료됩니다. 이 경우 "회사"는 "회원"이 등록한 전자우편 또는 전화, 기타의 방법을 통하여 해지의사를 통지합니다.<br> ③ 이용계약의 종료와 관련하여 발생한 손해는 이용계약이 종료된 해당 "회원"이 책임을 부담하여야 하고 "회사"는 일체의
                  책임을 지지 않습니다.
                  <br>
                  <br> 제21조 (회원에 대한 통지)<br> ① "회원"에 대한 통지를 하는 경우 "회사"는 "회원"이 제공한 e-mail 주소 또는 SMS, 연락처 등으로 할 수 있습니다.<br> ② "회사"는 불특정 다수 이용자에 대한 통지의 경우 "사이트" 게시판 등에 게시함으로써 개별 통지에 갈음할 수 있습니다.<br>
                  <br> 제22조(저작권 등의 귀속 및 이용제한)<br> ① "회사"가 작성한 저작물에 대한 저작권, 특허권, 상표권 기타 지식재산권은 "회사"에 귀속합니다.<br> ② "회원"은 "서비스"를 이용함으로써 얻은 정보를 "회사"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 등 기타 방법에 의하여 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.<br>
                  <br> 제23조(개인정보보호)
                  <br> ① "회사"는 "회원"의 개인정보 수집 시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.<br> ② "회사"는 회원가입 시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br> ③ "회사"는 "회원"의 개인정보를 수집·이용하는 때에는
                  당해 "회원"에게 그 목적을 고지하고 동의를 받습니다.<br> ④ "회사"는 수집된 개인정보를 목적 외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 "회원"에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br> ⑤ "회사"가 제2항과 제3항에 의해 "회원"의 동의를 받아야 하는 경우에는
                  개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제22조 제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 "회원"은 언제든지 이 동의를 철회할 수 있습니다.<br> ⑥ "회원"은 언제든지 "회사"가 가지고 있는 자신의 개인정보에
                  대해 열람 및 오류정정을 요구할 수 있으며 "회사"는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. "회사"가 오류의 정정을 요구한 경우에는 "회사"는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다. 단, 열람 및 오류 정정의 절차는 "회사"가 정한 바에 따릅니다.<br> ⑦ "회사"는 개인정보 보호를 위하여 "회원"의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 은행계좌 등을 포함한
                  "회원"의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 "회원"의 손해에 대하여 모든 책임을 집니다.<br> ⑧ "회사" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br> ⑨ "회사"는 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에
                  관한 "회원"의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 "회원"의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.<br>
                  <br> 제24조(기록 보존)<br> ① "회사"는 전자상거래 등에서의 소비자보호에 관한 법률에 따라 다음 각 호에 대한 기록은 법령에서 정한 기간 동안 보존합니다.<br> 1. 이용계약 또는 청약철회 등에 관한 기록<br> 2. 매입거래요청 및 "상품권" 핀번호 입력에 관한 기록(성명, 주소, 주민등록번호 등 거래의 주체를 식별할 수 있는 정보에 한함)<br> 3. 소비자의 불만 또는 분쟁처리에 관한 기록<br>
                  <br> 제25조(면책 조항)<br> ① "회사"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.<br> ② "회사"는 "회원"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여 책임을 지지 않습니다.<br> ③ "회사"는 "회원"이 "서비스"를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며, 그 밖의 "서비스"를 통하여
                  얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.<br> ④ "회사"는 "회원"이 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관해서는 책임을 지지 않습니다.<br> ⑤ "회사"는 "회원" 간 또는 "회원"과 제3자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임을 지지 않습니다.<br>
                  <br> 제26조(분쟁 해결)<br> ① "회사"는 "회원"이 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위해서 피해보상처리 기구를 설치, 운영합니다.<br> ② "회사"는 "회원"이 제기하는 불만사항 및 의견을 우선적으로 처리합니다. 다만 신속한 처리가 곤란한 경우에는 "회원"에게 그 사유와 처리일정을 즉시 통보합니다.<br>
                  <br> 제27조(준거법 및 관할법원)<br> ① 이 약관의 해석 및 "회사"와 "회원" 간의 분쟁에 대하여는 대한민국의 법령을 적용합니다.<br> ② "서비스" 이용 중 발생한 "회사"와 "회원" 간의 소송이 제기되는 경우에는 민사소송법에 따라 관할법원을 정합니다.<br>
                  <br> * 부 칙<br> ① 이 약관은 2018년 7월 19일부터 적용됩니다.<br>
                </div>
              </div>
              <div class="popback"></div>
            </div>
            <div class="check">
              <input type="checkbox" name="ckbox2" id="checkbox2">
              <label for="checkbox2" onclick="check(this)"><img src="${web_server_url}/images/front/ck-icon2.png" alt="빈체크 이미지"></label> 개인정보처리방침
              <button type="button" class="agree" onclick="pop2()">내용보기</button>
              <div class="popup2">
                <div class="pop_title2">
                  개인정보처리방침
                  <button type="button" href="javascript:;" onclick="close2('popup2','popback')">X</button>
                </div>
                <div class="pop_text2">
                  (주)피니(이하 “회사”)는 고객님의 개인정보를 중요시하며, 안전하게 보호하기 위하여 최선의 노력을 다하고 있습니다. <br> “회사”는 개인정보보호관련 법규 및 정부기관의 가이드 라인을 준수하고 있습니다.<br> 개인정보처리 방침은 관련 법규 또는 보다 나은 서비스의 제공을 위해 변경될 수 있으며, 이 경우 “회사”는 공지사항(또는 개별공지)을 통해 공지하고 있습니다.<br>
                  <br> 1. 수집하는 개인정보 항목<br> 1) 회원가입 시<br> -필수등록정보 : 이름(실명), 휴대폰번호, E-Mail, 비밀번호<br> 2) 매입 거래 요청 시<br> -필수등록정보 : 회원 본인계좌의 예금주명, 은행명, 계좌번호<br> 3) 기타<br> -접속로그, 서비스 이용기록, 접속 IP 정보, 매입거래 기록, 쿠키, 방문일시, 불량 이용기록<br> -상담내역
                  <br>
                  <br> 2. 수집한 개인정보의 이용목적<br> 1) E-mail(아이디), 비밀번호<br> -개인 식별<br> 2) 이름(실명), 휴대폰번호, 이통사 정보, 생년월일, 성별(별도 저장하지 않음)<br> -성인인증
                  <br> 3) 이름(실명), 휴대폰번호, 예금주명, 은행명, 계좌번호<br> -상품권 매입거래<br>
                  <br> 3. 개인정보의 보유 및 이용기간<br> “회사”는 원칙적으로 개인정보의 이용목적 달성 후에는 해당 회원의 개인정보를 지체없이 파기합니다.<br> 단, 내부방침 및 관련법령의 규정에 의하여 보존할 필요가 있는 경우, 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관하며, 보관하는 정보를 그 보관의 목적으로서만 이용합니다.<br> -계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래
                  등에서의 소비자보호에 관한 법률)<br> -대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래 등에서의 소비자보호에 관한 법률)<br> -소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래 등에서의 소비자보호에 관한 법률)<br> -웹사이트 방문기록 : 3개월 (통신비밀보호법)<br>
                  <br> 4. 개인정보의 파기절차 및 방법<br> 1) 파기절차<br> -회원의 개인정보는 목적이 달성된 후 별도의 DB로 옮겨져 내부방침 및 기타 관련 법령에 의한 정보보호 사유(개인정보의 보유 및 이용기간 참조)에 따라 일정기간 보관 된 후 파기됩니다.<br> -별도 DB로 옮겨진 개인정보는 법률에 의한 경우를 제외하고는 다른 목적으로 이용되지 않으며 안전하게 관리되고 있습니다.<br> 2) 파기방법<br> -전자적
                  파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 안전한 방법을 사용하여 파기합니다.<br> -종이에 출력된 개인정보는 분쇄기를 이용하여 분쇄하거나 소각을 통하여 파기합니다.<br>
                  <br> 5. 개인정보의 제3자 제공 및 위탁<br> 1) 개인정보 제3자 제공<br> -“회사”는 원칙적으로 개인정보의 수집 및 이용목적 외에는 회원의 개인정보를 제3자에게 제공하지 않습니다. 다만 아래의 경우는 예외로 합니다.<br> -회원이 사전에 동의한 경우<br> -법령의 규정에 의거하거나, 수사목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<br>
                  <br> 2) 개인정보 위탁<br> “회사”는 서비스의 제공에 있어 반드시 필요한 업무 중 일부를 외부 업체에게 위탁하여 수행하고 있습니다. <br> 외부업체에게 위탁 시 관계 법령에 따라 계약서 등을 통하여 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고, 이를 준수하도록 관리감독하고 있습니다.<br> 더 나은 서비스 제공을 위하여 “회사”는 아래와 같은 업무를 외부 업체에 위탁하고 있습니다.<br>
                  <br>
                  <table class="type11">
                    <tr>
                      <th>수탁업체</th>
                      <th>위탁업무</th>
                    </tr>
                    <tr>
                      <td>로움아이티(주)</td>
                      <td>본인인증</td>
                    </tr>
                    <tr>
                      <td>(주)쿠콘<br>신한은행</td>
                      <td>실시간 계좌이체</td>
                    </tr>
                  </table>
                  <br>
                  <br> 6. 회원 권리와 그 행사 방법<br> -회원은 언제든지 본인의 개인정보를 조회, 수정할 수 있으며, 회원탈퇴를 통해 개인정보 이용에 대한 동의 등을 철회할 수 있습니다.<br> -회원 본인의 개인정보의 수정 및 조회를 위해서는 [마이페이지] 내의 [개인정보] 항목에서 확인이 가능하며, 회원 탈퇴는 [마이페이지] 내 [개인정보] 항목의 [회원탈퇴하기]에서 본인 확인 절차를 거친 후 탈퇴가 가능합니다.<br>                  -“회사”의 개인정보보호책임자에게 서면, 전화 또는 이메일로 연락하여 개인정보의 열람/수정을 요청할 수 있습니다.<br> -회원이 개인정보의 오류에 대한 정정 요청을 한 경우, 정정이 완료되기 전까지 해당 개인정보를 이용 또는 제공하지 않으며, 회원의 요청에 의해 삭제된 개인정보는 “3. 개인정보의 보유 및 이용기간” 항목에 명시된 바에 따라 취급하고, 그 외의 용도로는 열람, 이용할 수 없도록 하고 있습니다.<br>                  -잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리 결과를 제3자에게 지체없이 통지하고 정정이 이루어지도록 하고 있습니다.<br> -만 14세 이상인 경우에만 회원가입이 가능하며, 만 14세 미만 아동의 개인정보는 원칙적으로 수집하지 않습니다.<br>
                  <br> 7. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항<br> 1) “회사”는 더 나은 서비스 제공을 위해 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’를 사용합니다.<br> 2) 쿠키란 라이브콘 웹사이트를 운영하는데 이용되는 서버가 회원의 컴퓨터로 전송하는 아주 작은 텍스트 파일로서 회원의 컴퓨터 하드디스크에 저장됩니다. 회원은 쿠키 사용여부를 선택할 수 있습니다. 단, 쿠키 사용을
                  거부하였을 경우, 서비스 제공에 어려움이 있을 수 있습니다.<br> 3) 쿠키 설정 거부 방법<br> -사용하는 웹브라우저의 옵션 설정을 통해 모든 쿠키를 허용 또는 쿠키를 저장할 때마다 확인절차를 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 단, 쿠키 저장을 거부한 경우, 로그인이 필요한 라이브콘의 일부 서비스 이용에 어려움이 있을 수 있습니다.<br> 4) 쿠키 사용 허용여부 설정 방법 (Internet
                  Explorer의 경우)<br> -브라우저 [도구] 메뉴 -> [인터넷옵션] 선택<br> -[개인정보] 에서 [고급] 선택<br> -쿠키 허용여부 선택<br>
                  <br> 8. 개인정보 보호 책임자<br> “회사”는 개인정보 보호와 관련한 불만 등을 처리하기 위하여 고객서비스 담당 부서 및 개인정보책임자를 지정하고 있습니다.<br>
                  <br>
                  <table class="type11">
                    <tr>
                      <th>구분</th>
                      <th>정보</th>
                      <th>E-mail</th>
                      <th>연락처</th>
                    </tr>
                    <tr>
                      <td>고객서비스 담당부서</td>
                      <td>고객상담실</td>
                      <td>help@finy.co.kr</td>
                      <td>02-839-0994</td>
                    </tr>
                    <tr>
                      <td>개인정보관리책임자</td>
                      <td>정석봉(CEO)</td>
                      <td>help@finy.co.kr</td>
                      <td>02-839-0994</td>
                    </tr>
                  </table>
                  <br>
                  <br> 기타 개인정보침해에 대한 신고나 상담이 필요한 경우, 아래 기관에 문의하시기 바랍니다.<br> -개인정보분쟁조정위원회(www.kopico.go.kr/국번없이 118)<br> -개인정보보호위원회(www.pipc.go.kr/국번없이 118)<br> -대검찰청 사이버범죄수사단(www.spo.go.kr/국번없이 1301)<br> -경찰청 사이버안전국(cyberbureau.police.go.kr/182)<br>
                </div>
              </div>
              <div class="popback"></div>
            </div>
          </li>
        </ul>
      </div>
      <div class="join-sns">
        <p>수신동의</p>
        <ul>
          <li>
            <input type="checkbox" name="mailCheckYn" id="mailCheckYn">
            <label for="mailCheckYn" onclick="check(this)"><img src="${web_server_url}/images/front/ck-icon2.png" alt="빈체크 이미지"></label> 이메일 마케팅 수신동의</li>
          <li>
            <input type="checkbox" name="smsYn" id="smsYn">
            <label for="smsYn" onclick="check(this)"><img src="${web_server_url}/images/front/ck-icon2.png" alt="빈체크 이미지"></label> SMS 마케팅 수신동의</li>
        </ul>
      </div>
      <div class="join-btn">

     	    <button type="button"  onclick="fn_join()">회원가입</button> 
      </div>
    </div>
  </div>
  </form>
</body>

</html>