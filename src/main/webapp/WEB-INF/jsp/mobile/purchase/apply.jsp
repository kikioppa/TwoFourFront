<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
  <title>매입신청 STEP01</title>
  <script>
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
    	var rowCnt = $("#row_add").find('tr').length;
		if(rowCnt >= 50){
			alert('최대 50개까지만 입력이 가능합니다.');
			return;
		}else{
			for(var i = 1 + rowCnt; i < rowCnt+11;i++ ){
	    		var oRowa = row_add.insertRow();
	    		oRowa.onmouseover = function() {
	    			row_add.clickedRowIndex = this.rowIndex
	    		};
	    		var td1 = oRowa.insertCell();
	    		var td2 = oRowa.insertCell();
	    		
	    		td1.innerHTML =
	    			'<td>' + i + '</td>';
	    		
	    		td2.innerHTML =
	    			'<td><input type="text" maxlength="4" onkeypress="nolang();">' +
	    			'-' +
	    			'<input type="text" maxlength="4" onkeypress="nolang();">' +
	    			'-' +
	    			'<input type="text" maxlength="4" onkeypress="nolang();">' +
	    			'-' +
	    			'<input type="text" maxlength="6" onkeypress="nolang();"></td>';
	    	}
			
		}
    }
    
    function addrow2() {
    	var rowCnt = $("#row_add2").find('tr').length;
		if(rowCnt >= 50){
			alert('최대 50개까지만 입력이 가능합니다.');
			return;
		}else{
			for(var i = 1 + rowCnt; i < rowCnt+11;i++ ){
	    		var oRowa = row_add2.insertRow();
	    		oRowa.onmouseover = function() {
	    			row_add2.clickedRowIndex = this.rowIndex
	    		};
	    		var td1 = oRowa.insertCell();
	    		var td2 = oRowa.insertCell();
	    		
	    		td1.innerHTML =
	    			'<td>' + i + '</td>';
	    		
	    		td2.innerHTML =
	    			'<td><input type="text" maxlength="4" onkeypress="nolang();">' +
	    			'-' +
	    			'<input type="text" maxlength="4" onkeypress="nolang();">' +
	    			'-' +
	    			'<input type="text" maxlength="4" onkeypress="nolang();">' +
	    			'-' +
	    			'<input type="text" maxlength="4" onkeypress="nolang();"></td>';
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
		var giftGubun = $('input[name="giftWM"]:checked').val();
		
		if (returnStr  && !frm.ckbox3.checked) {
    	    alert('개인정보처리방침에 동의해주세요');
    	    returnStr = false;
    	}
		
		if (returnStr  && !frm.ckbox4.checked) {
    	    alert('매입 서비스 이용조건 및 매입 진행 동의에 동의해주세요');
    	    returnStr = false;
    	  } 
		
		$.table = '';
		if(giftGubun == 'W'){
			$.table = $("#row_add tr");
		}else{
			$.table = $("#row_add2 tr");
		}
// 		$("#row_add tr").each(function(index){
		$.table.each(function(index){
			var finCode = '';
// 			console.log('eeedaass : ' + $(this).find('input').val() + "    index : " + index);
// 			console.log('eeedaass11 : ' + $(this).find('td').eq(1).find('input').val() + "    index : " + index);
			$(this).find('td').find('input').each(function(i){
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
		
// 		console.log('finCodeArr : ' + finCodeArr.substring(1));
		
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
						<li>
							<label for="giftcard-online">
								<input type="radio" id="giftcard-online" name="giftWM" checked="checked" value="W">
								<div class="label">
									<span class="icon-radio"></span>
									<div class="text">
									 컬처랜드 문화상품권<br>(컬처랜드에서 발행한 문화상품권 / 온라인문화상품권)
									</div>
								</div>
							</label>
						</li>
						<li>
							<label for="giftcard-mobile">
								<input type="radio" id="giftcard-mobile" name="giftWM" value="M">
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
				<ul>
					<li class="item">
						<span class="num">1</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">2</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">3</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">4</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">5</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">6</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">7</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">8</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">9</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  	<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
						</div>
       				</li>
					<li class="item">
						<span class="num">10</span>
						<div class="input-formula">
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
							  <input type="text" onkeypress="nolang()" maxlength="4">
							</div>
							<span class="dash"> - </span>
							<div class="input-text-wrap underline-type">
								<input type="text" onkeypress="nolang()" maxlength="4">
							</div>
						</div>
       				</li>       				       				       				       				       				       				
       			</ul>
       			<div class="btn-wrap">
					<a href="" onClick="addrow()" class="btn more square lg">&#43;추가하기 (10개씩&#47; 최대50개까지)</a>
				</div>
			</div>
		</section>

		<section class="submit-btn">
			<a href="" onclick="fn_purchase()" class="btn primary lg square">매입요청하기</a>
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
		  <h2>소제목은 여기에</h2>
		원장은 국회의 동의를 얻어 대통령이 임명하고, 그 임기는 4년으로 하며, 1차에 한하여 중임할 수 있다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다. 근로자는 근로조건의 향상을 위하여 자주적인 단결권·단체교섭권 및 단체행동권을 가진다. 대통령이 궐위되거나 사고로 인하여 직무를 수행할 수 없을 때에는 국무총리, 법률이 정한 국무위원의 순서로 그 권한을 대행한다. 모든 국민은 법률이 정하는 바에 의하여 국가기관에 문서로 청원할 권리를 가진다. 군인은 현역을 면한 후가 아니면 국무총리로 임명될 수 없다. 대통령은 필요하다고 인정할 때에는 외교·국방·통일 기타 국가안위에 관한 중요정책을 국민투표에 붙일 수 있다.
		
		국군의 조직과 편성은 법률로 정한다. 공개하지 아니한 회의내용의 공표에 관하여는 법률이 정하는 바에 의한다. 대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 대한민국의 국민이 되는 요건은 법률로 정한다. 정기회의 회기는 100일을, 임시회의 회기는 30일을 초과할 수 없다. 선거에 있어서 최고득표자가 2인 이상인 때에는 국회의 재적의원 과반수가 출석한 공개회의에서 다수표를 얻은 자를 당선자로 한다. 모든 국민은 종교의 자유를 가진다. 모든 국민의 재산권은 보장된다. 그 내용과 한계는 법률로 정한다. 정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다.
		  <h2>소제목은 여기에</h2>
		국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 법률은 특별한 규정이 없는 한 공포한 날로부터 20일을 경과함으로써 효력을 발생한다. 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. 국가는 법률이 정하는 바에 의하여 재외국민을 보호할 의무를 진다. 재산권의 행사는 공공복리에 적합하도록 하여야 한다.
		
		누구든지 체포 또는 구속의 이유와 변호인의 조력을 받을 권리가 있음을 고지받지 아니하고는 체포 또는 구속을 당하지 아니한다. 체포 또는 구속을 당한 자의 가족등 법률이 정하는 자에게는 그 이유와 일시·장소가 지체없이 통지되어야 한다. 국회의원은 그 지위를 남용하여 국가·공공단체 또는 기업체와의 계약이나 그 처분에 의하여 재산상의 권리·이익 또는 직위를 취득하거나 타인을 위하여 그 취득을 알선할 수 없다. 헌법에 의하여 체결·공포된 조약과 일반적으로 승인된 국제법규는 국내법과 같은 효력을 가진다. 정당의 목적이나 활동이 민주적 기본질서에 위배될 때에는 정부는 헌법재판소에 그 해산을 제소할 수 있고, 정당은 헌법재판소의 심판에 의하여 해산된다.
		
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
		원장은 국회의 동의를 얻어 대통령이 임명하고, 그 임기는 4년으로 하며, 1차에 한하여 중임할 수 있다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다. 근로자는 근로조건의 향상을 위하여 자주적인 단결권·단체교섭권 및 단체행동권을 가진다. 대통령이 궐위되거나 사고로 인하여 직무를 수행할 수 없을 때에는 국무총리, 법률이 정한 국무위원의 순서로 그 권한을 대행한다. 모든 국민은 법률이 정하는 바에 의하여 국가기관에 문서로 청원할 권리를 가진다. 군인은 현역을 면한 후가 아니면 국무총리로 임명될 수 없다. 대통령은 필요하다고 인정할 때에는 외교·국방·통일 기타 국가안위에 관한 중요정책을 국민투표에 붙일 수 있다.
		
		국군의 조직과 편성은 법률로 정한다. 공개하지 아니한 회의내용의 공표에 관하여는 법률이 정하는 바에 의한다. 대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다. 대한민국의 국민이 되는 요건은 법률로 정한다. 정기회의 회기는 100일을, 임시회의 회기는 30일을 초과할 수 없다. 선거에 있어서 최고득표자가 2인 이상인 때에는 국회의 재적의원 과반수가 출석한 공개회의에서 다수표를 얻은 자를 당선자로 한다. 모든 국민은 종교의 자유를 가진다. 모든 국민의 재산권은 보장된다. 그 내용과 한계는 법률로 정한다. 정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다.
		
		국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 법률은 특별한 규정이 없는 한 공포한 날로부터 20일을 경과함으로써 효력을 발생한다. 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. 국가는 법률이 정하는 바에 의하여 재외국민을 보호할 의무를 진다. 재산권의 행사는 공공복리에 적합하도록 하여야 한다.
		
		누구든지 체포 또는 구속의 이유와 변호인의 조력을 받을 권리가 있음을 고지받지 아니하고는 체포 또는 구속을 당하지 아니한다. 체포 또는 구속을 당한 자의 가족등 법률이 정하는 자에게는 그 이유와 일시·장소가 지체없이 통지되어야 한다. 국회의원은 그 지위를 남용하여 국가·공공단체 또는 기업체와의 계약이나 그 처분에 의하여 재산상의 권리·이익 또는 직위를 취득하거나 타인을 위하여 그 취득을 알선할 수 없다. 헌법에 의하여 체결·공포된 조약과 일반적으로 승인된 국제법규는 국내법과 같은 효력을 가진다. 정당의 목적이나 활동이 민주적 기본질서에 위배될 때에는 정부는 헌법재판소에 그 해산을 제소할 수 있고, 정당은 헌법재판소의 심판에 의하여 해산된다.
		
		</pre>
      </div>
    </div>
  </div>  
  
</body>