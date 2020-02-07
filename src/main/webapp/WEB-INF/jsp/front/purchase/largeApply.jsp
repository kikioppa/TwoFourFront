<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
  <title>문화 1번가 - 대용량 매입신청 STEP01</title>
  <script>

    function nolang() {
      if (event.keyCode < 48 || event.keyCode > 57) {
        event.returnValue = false;
      }
    }
    
    function fn_purchase(){
    	if(isValid() && confirm('매입 요청 시, 취소할 수 없습니다.\n매입요청 하시겠습니까?')){
    		var option = {
    				type : "post",
    				url: './largeFinCodeConFirm.json',
    				data: $("#frm").serialize() ,
    				dataType: 'json',
    				beforeSend: function() {
    					$('#ajax_load_indicator').show();
    				},
    				success : function(data) {
    					console.log(data);
    					if(data.result == 'success'){
//     						alert('정상처리 되었습니다.');
    						$("#buySeq").val(data.buySeq);
    						$("#frm").attr('action','./largeComplete.do');
    						$("#frm").submit();
    					}else if(data.result == 'acntError'){
    						alert('매입 신청은 계좌인증 후 가능합니다.');
    						return;
    					}else if(data.result == 'fileError'){
    						alert('첨부파일 오류 입니다.');
    						return;
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
		var fincheck = true;		
		var fileExt = getExtensionOfFilename($("#comFileUploader0").val());
		
		if(returnStr  && !frm.ckbox3.checked) {
    	    alert('개인정보처리방침에 동의해주세요');
    	    returnStr = false;
    	}
		
		if(returnStr  && !frm.ckbox4.checked) {
    	    alert('매입 서비스 이용조건 및 매입 진행 동의에 동의해주세요');
    	    returnStr = false;
    	} 
		
		if(returnStr  &&  $("#comFileUploader0").val() == ''){
			alert('엑셀파일을 첨부해 주세요');
    	    returnStr = false;
		}
		
		console.log('fileExt : ' + fileExt);
		
		if(returnStr  && (fileExt != '.xlsx' && fileExt != '.xls')){
			alert('형식에 맞는 파일을 첨부해 주세요');
    	    returnStr = false;
		}
		
// 		if(returnStr  && finCodeArr.substring(1).length == 0){
// 			alert('핀코드를 입력해 주세요.');
// 			returnStr = false;
// 		}else{
// 			$("#finCodeArr").val(finCodeArr.substring(1));
// 		}
		
		return returnStr;	
	}
	
    function go_apply(){
    	if(confirm("일반 매입신청으로 이동하시겠습니까? ")){
    		$("#frm").attr('action','./apply.do');
    		$("#frm").submit();
    	}
    }
    
    function go_main(){
    	if(confirm("취소하시겠습니까?")){
    		$("#frm").attr('action','/index.do');
    		$("#frm").submit();
    	}
    }
  </script>
</head>

<body>
	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
	  <input type="hidden" name="buySeq" id="buySeq" value="" />
	  <input type="hidden" name="largeYn" id="largeYn" value="Y" />
	  <!--section-->
	  <div class="section">
	    <div class="section-main apply01">
	      <h2>대용량 상품권 매입신청</h2>
	
	      <div class="btn-wrap">
	        <button type="button" class="btn-black" onclick="go_apply()">일반 매입신청하기 (50개 미만)</button>
	      </div>
	      <div class="matters-text">
	        <div class="matters-img">
	          <img src="${web_server_url}/images/front/speaker.png" alt="확성기 이미지">
	        </div>
	        <div>
	          <h4>대용량 매입신청 전 필독사항</h4>
	          <ol>
	            <li>50개 이상의 상품권의 핀보호를 신청할 경우 사용하는 서비스입니다.</li>
	            <li>샘플엑셀 파일을 다운로드 받으시고, 핀번호를 작성 후 업로드 하시면 됩니다.</li>
	            <li>신청한 결과에 대해서는 마이페이지 > 매입신청내역 > 대용량 매입신청 내역 페이지에서 확인이 가능합니다.</li>
	            <li>입금관련 문제시 고객센터 1:1문의 또는 help@xxx.xxx 으로 문의해주시기 바랍니다.</li>
	          </ol>
	        </div>
	      </div>
	
	      <h3>상품권 선택</h3>
	      <p class="ref">* 엑셀 샘플파일을 다운로드 > 엑셀파일에 핀번호 작성 > 작성한 엑셀파일 업로드 순으로 진행하시면 됩니다.</p>
		  
	      <div class="choice big">
	        <ul>
	          <li>
	            <div class="th label">대용량 엑셀샘플파일</div>
	            <div class="td">
	              <a href="${web_server_url}/purSample/purchase_sample.xlsx"><button type="button" class="gray">엑셀다운로드</button></a>
	              <span>대용량 엑셀샘플 다운받기</span>
	            </div>
	          </li>
	          <li>
            <div class="th label">엑셀 업로드</div>
            <div class="td">
              <div class="input-file-wrap">
                <input type="file" name="file_0" id="comFileUploader0" placeholder="" class="upload-file">
                <div class="upload-file-filename" onclick="$('.upload-file').click();"><span class="placeholder">파일을 선택하세요</span></div>
              </div>

              <script>
                // 파일명 담기
                $('input[type="file"]').change(function(e){
                  var fileRoot = $(this).val();
                  var filename = fileRoot.split('\\').reverse()[0];
                  $('.upload-file-filename').html(filename);
                });
              </script>

              <button type="button" class="line-type" onclick="$('.upload-file').click();">업로드</button>
            </div>
          </li>
	        </ul>
	      </div>
	      <h3>개인정보처리 방침 및 서비스이용 약관동의</h3>
	        <ul class="use">
	          <li>
	            <div class="check">
	              <input type="checkbox" name="ckbox3" id="checkbox3">
	              <label for="checkbox3" onclick="check(this)"><img src="${web_server_url}/images/front/ck-icon2.png" alt="빈체크 이미지"></label> 개인정보처리방침
	              <button class="agree" type="button" onclick="pop()">내용보기</button>
	              <div class="popup">
	                <div class="pop_title">
	                  개인정보처리방침
	                  <button type="button" onclick="close1('popup','popback')">X</button>
	                </div>
	                <div class="pop_text">
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
	                  Explorer의 경우)
	                  <br> -브라우저 [도구] 메뉴 -> [인터넷옵션] 선택<br> -[개인정보] 에서 [고급] 선택<br> -쿠키 허용여부 선택<br>
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
	          <li>
	            <div class="check">
	              <input type="checkbox" name="ckbox4" id="checkbox4">
	              <label for="checkbox4" onclick="check(this)"><img src="${web_server_url}/images/front/ck-icon2.png" alt="빈체크 이미지"></label> 매입 서비스 이용조건 및 매입진행 동의
	              <button class="agree" type="button" onclick="pop2()">내용보기</button>
	              <div class="popup2">
	                <div class="pop_title2">
	                  개인정보처리방침
	                  <button type="button" onclick="close2('popup2','popback')">X</button>
	                </div>
	                <div class="pop_text2">
	                  안전하고 편리한 매입 서비스 제공을 위해 라이브콘은 아래 사항들에 대해 고객님의 동의를 구하고 있으며, 본 이용조건에 동의하셔야 매입 서비스 이용이 가능합니다.
	                  <br> · 라이브콘 상품권 매입서비스는 (주)한국문화진흥에서 발행한 문화상품권 (PIN코드) 만 매입이 가능합니다.
	                  <br>· 부정한 방법으로 획득한 상품권을 거래할 경우, 발생하는 민,형사상의 모든 책임은 사용자 본인에게 있습니다.
	                  <br>· 상품권 매입 대금은 사용자 본인이 직접 인증한 본인 계좌로 입금되며, 입금 완료 후에는 최소 등 변경이 불가능합니다.
	                  <br>· 상품권 매입 시 문화 1번가는 일정 비율의 매입수수료를 차감 후, 매입대금응ㄹ 사용자에게 지급합니다. 매입수수료율은 공지사항 게시판을 통해 공지합니다.
	                  <br>· 부정한 목적 또는 방법으로 문화 1번가의 매입 서비스 이용 시 발생하는 모든 민,형사상의 모든 책임은 사용자 본인에게 있습니다.
	                  <br>· 완료된 매입 거래 건은 취소나 환불이 되지 않습니다.
	                  <br>· 매입이 완료된 상품권(PIN코드)는 사용완료 처리되므로 매입 완료 후 매입한 상품권(PIN코드)는 타 사용처에서 사용이 불가능합니다.
	                </div>
	              </div>
	              <div class="popback"></div>
	            </div>
	          </li>
	        </ul>
	      <div class="notice-gray-bg">
	        <p class="red-font">
	          대용량 매입신청의 경우에는 바로 입금이 되지 않습니다. 유선으로 확인 후 입금처리됨을 알려드립니다.
	        </p>
	      </div>
	      
	      <div class="request big">
	        <div>
	          <button type="button" class="reset" type="reset" onclick="go_main()">취소</button>
	          <button type="button" class="request" onclick="fn_purchase()">대용량 매입 신청하기</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</form>
</body>
