<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
  <title>매입신청 STEP01</title>
  <script>
  $(function() {
	  $(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
	  $("input:text[numberOnly]").keypress(function(evt){		
			var code = evt.which?evt.which:event.keyCode;
			if(code < 48 || code > 57){
				return false;
			}
			
	});

	  
	$(document).on('keypress','.inputs',function() {
		var value = $(this).val();
		if(value.length >= $(this).attr('maxlength')) {
		    var inputs = $(this).closest('ul').find(':input');
		    inputs.eq( inputs.index(this)+ 1 ).focus();
		}
	});	  
  });

  	
    function check(e) {
      var dama = e.childNodes[0]
      if (dama.src.match("ck-icon2")) {
        dama.src = "${web_server_url}/images/front/ck-icon.png";
      } else {
        dama.src = "${web_server_url}/images/front/ck-icon2.png";
      }
    }

    function nolang() {
      if (event.keyCode < 48 || event.keyCode > 57) {
        event.returnValue = false;
      }
    }
    
    function addrow() {
    	var maxleng = 0;
    	if($("input[name=giftWM]:checked").val() == 'W'){
    		maxleng = 6;
    	}else{
    		maxleng = 4;
    	}
    	
    	var rowCnt = $("#row_add").find('li').length;
    	
		if(rowCnt >= 50){
			alert('최대 50개까지만 입력이 가능합니다.');
			return;
		}else{
			for(var i = 1 + rowCnt; i < rowCnt+11;i++ ){
	    		var oRowa = '';
	    		oRowa = '<li><span class="num">' + i + '</span>';
	    		oRowa += '<div class="input-formula">';
	    		oRowa += '<div class="input-text-wrap underline-type">';
	    		oRowa += '<input type="text" maxlength="4"  class="inputs">';
	    		oRowa += '</div>';
	    		oRowa += '<span class="dash"> - </span>';
	    			
	    		oRowa += '<div class="input-text-wrap underline-type">';
				oRowa += '<input type="text" maxlength="4" numberOnly class="inputs">';
				oRowa += '</div>';
				oRowa += '<span class="dash"> - </span>';

				oRowa += '<div class="input-text-wrap underline-type">';
				oRowa += '<input type="text" maxlength="4" numberOnly class="inputs">';
				oRowa += '</div>';

				oRowa += '<span class="dash"> - </span>';

				oRowa += '<div class="input-text-wrap underline-type">';
				oRowa += '<input class="lastIp inputs" type="text" maxlength="' + maxleng + '" numberOnly >';
				oRowa += '</div>';

				oRowa += '</div></li>';
				$("#row_add").append(oRowa);
	    	}
			
		}
    }
    
    function fn_purchase(){
    	if(isValid() && confirm('매입요청 하시겠습니까?')){
    		$("#giftGubun").val($('input[name="giftWM"]:checked').val());
    		
    		var option = {
    				type : "post",
    				url: './finCodeConFirm.json',
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
    						$("#frm").attr('action','./confirm.do');
    						$("#frm").submit();
    					}else if(data.result == 'acntError'){
    						alert('매입 신청은 계좌인증 후 가능합니다.');
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
		var finCodeArr = '';
		
		if (returnStr  && !frm.ckbox3.checked) {
    	    alert('개인정보처리방침에 동의해주세요');
    	    returnStr = false;
    	}
		
		if (returnStr  && !frm.ckbox4.checked) {
    	    alert('매입 서비스 이용조건 및 매입 진행 동의에 동의해주세요');
    	    returnStr = false;
    	  } 
		
		$.table = '';
		$.table = $("#row_add li");
		
// 		$("#row_add tr").each(function(index){
		$.table.each(function(index){
			var finCode = '';
// 			console.log('eeedaass : ' + $(this).find('input').val() + "    index : " + index);
// 			console.log('eeedaass11 : ' + $(this).find('td').eq(1).find('input').val() + "    index : " + index);
			$(this).find('div').find('input').each(function(i){
				if($(this).val() !=''){
					finCode = finCode + '-' + $(this).val().toString();
				}
				
			})
// 			console.log('aa : ' + finCode.substring(1).length );
			if(finCode.substring(1).length > 0 && finCode.substring(1).length < 19){
				fincheck = false;
				return;
			}else if(finCode.substring(1).length > 0){
				finCodeArr = finCodeArr + '|' + finCode.substring(1); 
			}
		})
		
		console.log('finCodeArr : ' + finCodeArr.substring(1));
		
		if(returnStr  && !fincheck){
			alert('잘못된 핀코드가 존재합니다.');
			returnStr = false;
		}
		
		if(returnStr  && finCodeArr.substring(1).length == 0){
			alert('핀코드를 입력해 주세요.');
			returnStr = false;
		}else{
			$("#finCodeArr").val(finCodeArr.substring(1));
		}
		
		return returnStr;	
	}
    
    function go_large(){
    	if(confirm("대용량 매입신청으로 이동하시겠습니까? ")){
    		$("#frm").attr('action','./largeApply.do');
    		$("#frm").submit();
    	}
    }
    
    function go_main(){
    	if(confirm("취소하시겠습니까?")){
    		$("#frm").attr('action','/index.do');
    		$("#frm").submit();
    	}
    }
    
    function gift_gubun(gubun){
		$("input[type=text]").val('');    	
    	if(gubun == 'W'){
			console.log('www');    		
    		$(".lastIp").attr('maxlength','6');
    	}else{
    		console.log('mmm');
    		$(".lastIp").attr('maxlength','4');
    	}
    }
  </script>
</head>

<body>
  <div class="container apply">
		<section class="important-notice">
			<div class="indicater">
				<ol>
					<li><span class="circle on">1</span></li>
					<li><span class="circle">2</span></li>
					<li><span class="circle">3</span></li>
				</ol>
			</div>
			<div class="border-box">
				<div class="title">
					 매입신청 전 필독사항
				</div>
				<ul>
					<li>1. 소유하고 있는 상품권의 핀보호만 입력하시면 인증된 계좌로 바로 즉시 송금됩니다.</li>
					<li>2. 24시간 자동화 운영입니다. 매일 은행망 점검 시간을 제외한  언제, 어디서든 매입 신청이 가능합니다.</li>
					<li>3. 현재는 컬처랜드에서 발행하는 아래 상품권만 매입이 가능합니다. (문화상품권 / 온라인문화상품권 / 모바일문화상품권-16자리)</li>
					<li>4. 매입수수료는 <c:out value="${charge}"/>% 입니다. 매입 수수료를 나머지 금액을 입금해드립니다.</li>
					<li>5. 입금관련 문제시 고객센터 1:1문의 또는 help@ms1st.co.kr 으로 문의해주시기 바랍니다. </li>
				</ul>
			</div>
		</section>

		<section class="order-limit-notice">
			<h2>매입금액 한도 정책</h2>
			<div class="topper">
				&#42;매입금액 한도 정책입니다.<em>필독하시기 바랍니다.</em>
			</div>
			<div class="notice">
				<ul>
					<li class="item">
						<span class="profile">1회</span>
						<div class="content">
							1회 최소/최대금액<br>
							<span class="detail">
							최소 1만원 이상, 최대 500만원 이하
							</span>
						</div>
					</li>
					<li class="item">
						<span class="profile">1일</span>
						<div class="content">
							1일 누적 매입한도<br>
							<span class="detail">
							 최대 10,000,000원
							</span>
						</div>
					</li>
					<li class="item">
						<span class="profile">1개월</span>
						<div class="content">
							1개월 누적 매입한도<br>
							<span class="detail">
							 최대 20,000,000원
							</span>
						</div>
					</li>
					<li class="item">
						<span class="profile">매입수수료</span>
						<div class="content">
							<br>
							<span class="detail">
							 <c:out value="${charge}" />%
							</span>
						</div>
					</li>					
				</ul>
			</div>
		</section>

		<section class="select">
			<h2>상품권 선택</h2>
			<div class="select-giftcard-wrap">
				<div class="title">필수 입력 상품권 종류</div>
					<ul>
						<li onclick="gift_gubun('W')">
							<label for="giftcard-online">
								<input type="radio" id="giftcard-online" name="giftWM" checked="checked" value="W" />
								<div class="label">
									<span class="icon-radio"></span>
									<div class="text">
									 컬처랜드 문화상품권<br>(컬처랜드에서 발행한 문화상품권 / 온라인문화상품권)
									</div>
								</div>
							</label>
						</li>
						<li onclick="gift_gubun('M')">
							<label for="giftcard-mobile">
								<input type="radio" id="giftcard-mobile" name="giftWM" value="M" />
								<div class="label">
									<span class="icon-radio"></span>
									<div class="text">
									 컬처랜드 문화상품권<br>( 컬처랜드에서 발행한 모바일 문화상품권)
									</div>
								</div>
							</label>
						</li>
					</ul>
			</div>
		</section>

		<section class="agree-form">
			<form name="frm" id="frm" method="post">
			<input type="hidden" name="finCodeArr" id="finCodeArr" value="" />
			<input type="hidden" name="giftGubun" id="giftGubun" value="" />
			<input type="hidden" name="largeYn" id="largeYn" value="N" />
			<input type="hidden" name="buySeq" id="buySeq" value="" />
			<h2>개인정보처리 방침 및 서비스이용 약관동의</h2>
			<div class="border-box">
				<ul>
					<li>
						<span class="checkbox-label">
							<label>
								<span class="checkbox-wrap">
									<input type="checkbox" name="ckbox3" id="checkbox3">
									<span class="icon"></span>
								</span>개인정보처리방침
							</label>
						</span>
						<span class="btn-wrap">
						  <!--modal description : modalOpen('모달id값') -->
							<a href="javascript:void(0)" onclick="modalOpen('#privacyPolicy');" class="link-btn-underline">전체보기</a>
						</span>
          			</li>
					<li>
						<span class="checkbox-label">
							<label>
								<span class="checkbox-wrap">
									<input type="checkbox" name="ckbox4" id="checkbox4">
									<span class="icon"></span>
								</span>매입 서비스 이용조건 및 매입진행 동의
							</label>
						</span>
						<span class="btn-wrap">
							<a href="javascript:void(0)" onclick="modalOpen('#conditionsOfUse');" class="link-btn-underline">전체보기</a>
						</span>
					</li>
				</ul>
			</div>
		</form>
		</section>

		<section class="pin-code">
			<h2>상품권 핀코드 입력</h2>
			<div class="topper">
			  &#42;모바일 문화상품권의 경우에는 핀번호가 16자리 입력
			</div>
			<div class="code-list">
				<ul id="row_add">
					<li class="item">
						<span class="num">1</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input class="lastIp inputs" type="text" numberOnly maxlength="6">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">2</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input class="lastIp inputs" type="text" numberOnly maxlength="6">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">3</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input class="lastIp inputs" type="text" numberOnly maxlength="6">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">4</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input class="lastIp inputs" type="text" numberOnly maxlength="6">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">5</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input class="lastIp inputs" type="text" numberOnly maxlength="6">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">6</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input class="lastIp inputs" type="text" numberOnly maxlength="6">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">7</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input class="lastIp inputs" type="text" numberOnly maxlength="6">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">8</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input class="lastIp inputs" type="text" numberOnly maxlength="6">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">9</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  	<input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input class="lastIp inputs" type="text" numberOnly maxlength="6">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">10</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" numberOnly class="inputs" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input class="lastIp inputs" type="text" numberOnly maxlength="6">
							</div>
						</div>
       				</li>       				       				       				       				       				       				
       			</ul>
       			<div class="btn-wrap" id="moreBtn">
					<a href="javascript:void(0);" onClick="addrow()" class="btn more square lg">&#43;추가하기 (10개씩&#47; 최대50개까지)</a>
				</div>
			</div>
		</section>

		<section class="submit-btn">
			<a href="javascript:void(0);" onclick="fn_purchase()" class="btn primary lg square">매입요청하기</a>
		</section>
    

	</div>
  
  
  <div class="modal-pop pullscreen-type terms" id="conditionsOfUse">
    <div class="template">
      <div class="header">
        <div class="title">
          매입 서비스 이용조건 및 매입진행 동의
        </div>
        <div class="suffix">
          <a href="javascript:console.log('close');" class="btn-close">
            <span class="icon">
              <svg 
                xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                viewBox="0 0 33 34"
                width="17" height="16.5">
                <path fill-rule="evenodd"  fill="rgb(255, 255, 255)"
                d="M34.008,30.582 L32.632,31.999 L17.518,17.391 L1.696,32.718 L0.304,31.282 L16.079,16.000 L0.992,1.418 L2.368,0.000 L17.498,14.625 L32.304,0.282 L33.696,1.718 L18.937,16.016 L34.008,30.582 Z"/>
              </svg>
            </span>
          </a>
        </div>
      </div>
      <div class="content-body">
        <div class="terms-of-use">
          <p>
            안전하고 편리한 매입 서비스 제공을 위해 문상1번가는 아래 사항들에 대해 고객님의 동의를 구하고 있으며, 본 이용조건에 동의하셔야 매입 서비스 이용이 가능합니다.
          </p>
            <ul>
              <li>-문상1번가 상품권 매입서비스는 (주)한국문화진흥에서 발행한 문화상품권 (PIN코드) 만 매입이 가능합니다.</li>
              <li>-부정한 방법으로 획득한 상품권을 거래할 경우, 발생하는 민,형사상의 모든 책임은 사용자 본인에게 있습니다.</li>
              <li>-상품권 매입 대금은 사용자 본인이 직접 인증한 본인 계좌로 입금되며, 입금 완료 후에는 최소 등 변경이 불가능합니다.</li>
              <li>-상품권 매입 시 문화 1번가는 일정 비율의 매입수수료를 차감 후, 매입대금응 사용자에게 지급합니다. 매입수수료율은 공지사항 게시판을 통해 공지합니다.</li>
              <li>-부정한 목적 또는 방법으로 문화 1번가의 매입 서비스 이용 시 발생하는 모든 민,형사상의 모든 책임은 사용자 본인에게 있습니다.</li>
              <li>-완료된 매입 거래 건은 취소나 환불이 되지 않습니다.</li>
              <li>-매입이 완료된 상품권(PIN코드)는 사용완료 처리되므로 매입 완료 후 매입한 상품권(PIN코드)는 타 사용처에서 사용이 불가능합니다.</li>
            </ul>
          </div>
      </div>      
    </div>
  </div>
  
</body>
