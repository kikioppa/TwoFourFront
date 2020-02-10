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
	    		oRowa += '<input type="text" maxlength="4" numberOnly class="inputs">';
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
					<li>4. 매입수수료는 13.0% 입니다. 매입 수수료를 나머지 금액을 입금해드립니다.</li>
					<li>5. 입금관련 문제시 고객센터 1:1문의 또는 help@xxx.xxx 으로 문의해주시기 바랍니다. </li>
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
								<input type="text" numberOnly class="inputs" maxlength="4">
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
								<input type="text" numberOnly class="inputs" maxlength="4">
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
								<input type="text" numberOnly class="inputs" maxlength="4">
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
								<input type="text" numberOnly class="inputs" maxlength="4">
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
								<input type="text" numberOnly class="inputs" maxlength="4">
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
								<input type="text" numberOnly class="inputs" maxlength="4">
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
								<input type="text" numberOnly class="inputs" maxlength="4">
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
								<input type="text" numberOnly class="inputs" maxlength="4">
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
								<input type="text" numberOnly class="inputs" maxlength="4">
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
								<input type="text" numberOnly class="inputs" maxlength="4">
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
		<pre>
		· 안전하고 편리한 매입 서비스 제공을 위해 문상1번가는 아래 사항들에 대해 고객님의 동의를 구하고 있으며, 본 이용조건에 동의하셔야 매입 서비스 이용이 가능합니다.
                  <br> · 문상1번가 상품권 매입서비스는 (주)한국문화진흥에서 발행한 문화상품권 (PIN코드) 만 매입이 가능합니다.
                  <br>· 부정한 방법으로 획득한 상품권을 거래할 경우, 발생하는 민,형사상의 모든 책임은 사용자 본인에게 있습니다.
                  <br>· 상품권 매입 대금은 사용자 본인이 직접 인증한 본인 계좌로 입금되며, 입금 완료 후에는 최소 등 변경이 불가능합니다.
                  <br>· 상품권 매입 시 문화 1번가는 일정 비율의 매입수수료를 차감 후, 매입대금응 사용자에게 지급합니다. 매입수수료율은 공지사항 게시판을 통해 공지합니다.
                  <br>· 부정한 목적 또는 방법으로 문화 1번가의 매입 서비스 이용 시 발생하는 모든 민,형사상의 모든 책임은 사용자 본인에게 있습니다.
                  <br>· 완료된 매입 거래 건은 취소나 환불이 되지 않습니다.
                  <br>· 매입이 완료된 상품권(PIN코드)는 사용완료 처리되므로 매입 완료 후 매입한 상품권(PIN코드)는 타 사용처에서 사용이 불가능합니다.
		</pre>
      </div>
    </div>
  </div>
  <div class="modal-pop pullscreen-type terms" id="privacyPolicy">
    <div class="template">
      <div class="header">
        <div class="title">
          개인정보처리방침
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
		<pre>
		문상21(이하 “회사”)은 고객님의 개인정보를 중요시하며, 안전하게 보호하기 위하여 최선의 노력을 다하고 있습니다. <br> “회사”는 개인정보보호관련 법규 및 정부기관의 가이드 라인을 준수하고 있습니다.<br> 개인정보처리 방침은 관련 법규 또는 보다 나은 서비스의 제공을 위해 변경될 수 있으며, 이 경우 “회사”는 공지사항(또는 개별공지)을 통해 공지하고 있습니다.<br>
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
                  <br> 7. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항<br> 1) “회사”는 더 나은 서비스 제공을 위해 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’를 사용합니다.<br> 2) 쿠키란 문상1번가 웹사이트를 운영하는데 이용되는 서버가 회원의 컴퓨터로 전송하는 아주 작은 텍스트 파일로서 회원의 컴퓨터 하드디스크에 저장됩니다. 회원은 쿠키 사용여부를 선택할 수 있습니다. 단, 쿠키 사용을
                  거부하였을 경우, 서비스 제공에 어려움이 있을 수 있습니다.<br> 3) 쿠키 설정 거부 방법<br> -사용하는 웹브라우저의 옵션 설정을 통해 모든 쿠키를 허용 또는 쿠키를 저장할 때마다 확인절차를 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 단, 쿠키 저장을 거부한 경우, 로그인이 필요한 문상1번가의 일부 서비스 이용에 어려움이 있을 수 있습니다.<br> 4) 쿠키 사용 허용여부 설정 방법 (Internet
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
                      <td>help@ms21st.co.kr</td>
                      <td>02-839-0994</td>
                    </tr>
                    <tr>
                      <td>개인정보관리책임자</td>
                      <td>정석봉(CEO)</td>
                      <td>help@ms21st.co.kr</td>
                      <td>02-839-0994</td>
                    </tr>
                  </table>
                  <br>
                  <br> 기타 개인정보침해에 대한 신고나 상담이 필요한 경우, 아래 기관에 문의하시기 바랍니다.<br> -개인정보분쟁조정위원회(www.kopico.go.kr/국번없이 118)<br> -개인정보보호위원회(www.pipc.go.kr/국번없이 118)<br> -대검찰청 사이버범죄수사단(www.spo.go.kr/국번없이 1301)<br> -경찰청 사이버안전국(cyberbureau.police.go.kr/182)<br>
		</pre>
      </div>
    </div>
  </div>  
  
</body>
