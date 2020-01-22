<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>대용량 상세345</title>
  <script type="text/javascript" src="/smarteditor/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
  <script type="text/javascript">
  	function fn_update(condition){
  		var msg = '';
  		if(condition == 'A' && $("#acceptYn").val() == 'Y' ){
  			alert('이미 접수된 매입입니다.');
  			return;
  		}else if(condition == 'D' && $("#acceptYn").val() == 'N'){
  			alert('접수되지 않은 매입입니다.');
  			return;
  		}else if(condition == 'D' && $("#depositYn").val() == 'Y'){
  			alert('이미 입금확인된 매입입니다.');
  			return;
  		}
  		
  		if(condition == 'A'){
  			msg = '접수확인을 하시겠습니까?';
  			$("#condition").val('accept');
  		}else{
  			msg = '입금확인을 하시겠습니까?';
  			$("#condition").val('deposit');
  		}
  		
  		if(confirm(msg)){
  			var option = {
  					type : "post",
  					url: './write_proc.json',
  					data: $("#frm").serialize() ,
  					dataType: 'json',
  					beforeSend: function() {
  						$('#ajax_load_indicator').show();
  					},
  					success : function(data) {
  						if(data.success){
  							alert('성공하였습니다.');
  							location.reload();
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
  	
  	function fn_contents(){
  		$("#contents").val(oEditors.getById["contents"].getIR());
  		
  		if(isValid() && confirm('저장하시겠습니까?')){
  			$("#condition").val('contents');
  			console.log('aa : ' + $("#condition").val());
  			
  			var option = {
				type : "post",
				url: './write_proc.json',
				data: $("#frm").serialize() ,
				dataType: 'json',
				beforeSend: function() {
					$('#ajax_load_indicator').show();
				},
				success : function(data) {
					if(data.success){
						alert('성공하였습니다.');
						location.reload();
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

		$("#contents").val(wordchk2($("#contents").val()));
		if(  returnStr && ($("#contents").val() == '<p><br></p>' || $("#contents").val() == '')){
			alert('내용을 입력해 주십시요.');
			$('#contents').focus();
			returnStr = false;
		}

		
		return returnStr;	
	}
  	
  	function go_paging(page){
		$("#frm").attr("action" , "largeDetail.do");
		$("#curPage").val(page);
		$("#frm").submit();
	}
  </script>
  
</head>
<body> 
<form name="frm" id="frm" method="post">
<input type="hidden" name="seq" id="seq" value="<c:out value="${detail.SEQ }" />" />
<input type="hidden" name="acceptYn" id="acceptYn" value="<c:out value="${detail.ACCEPT_YN }" />" />
<input type="hidden" name="depositYn" id="depositYn" value="<c:out value="${detail.DEPOSIT_YN }" />" />
<input type="hidden" name="condition" id="condition" value="" />
<input type="hidden" name="curPage" id="curPage" value="" />
<!--seciton-->
  <div class="list-section">
    <table class="detail-talbe">
      <tr>
        <th class="title">아이디</th>
        <td><c:out value="${detail.MEMBER_MAIL_ADDR }" /></td>
        <th class="title">이름</th>
        <td><c:out value="${detail.MEMBER_NAME }" /></td>
        <th colspan="2" class="title">매입 신청 날짜</th>
        <td colspan="2"><fmt:formatDate value="${detail.CREATION_DATE}" pattern="yyyy.MM.dd"/></td>
      </tr>
      <tr>
        <th class="title">은행</th>
        <td colspan="3"><c:out value="${detail.BANK_NAME }" /></td>
        <th colspan="2" class="title">계좌번호</th>
        <td colspan="2"><c:out value="${detail.ACNT_NUMBER }" /> </td>
      </tr>
      <tr>
        <th class="title">총매수</th>
        <td colspan="3"><c:out value="${detail.reqTotalRow }" /></td>
        <th colspan="2" class="title">총금액</th>
        <td colspan="2"><fmt:formatNumber value="${detail.reqTotalMoney }" pattern="#,###" /> </td>
      </tr>
      <tr>
        <th class="title">유효 매수</th>
        <td colspan="3"><c:out value="${detail.reqSuccRow }" /></td>
        <th colspan="2" class="title">유효 금액</th>
        <td colspan="2"><fmt:formatNumber value="${detail.reqSuccMoney }" pattern="#,###" /> </td>
      </tr>
      <tr>
        <th style="vertical-align: middle;" class="title">접수여부</th>
        <td style="vertical-align: middle;line-height: 2.5;" colspan="3">
        	<c:choose>
        		<c:when test="${detail.ACCEPT_YN eq 'Y' }">접수확인</c:when>
        		<c:otherwise>
        			접수대기
        			<button type="button" class="gray-btn" style="float: right;" onclick="fn_update('A')" >접수 확인</button>
        		</c:otherwise>
        	</c:choose>
        	
        </td>
        <th style="vertical-align: middle;" colspan="2" class="title">입금 여부</th>
        <td style="vertical-align: middle;line-height: 2.5;" colspan="2">
          <c:choose>
        		<c:when test="${detail.DEPOSIT_YN eq 'Y' }">입금확인</c:when>
        		<c:otherwise>
        			입금대기
        			<button type="button" class="gray-btn" style="float: right;" onclick="fn_update('D')">입금 확인</button>
        		</c:otherwise>
          </c:choose>
          
      </tr>
    </table>
    </div>
    
    <div class="info-table-list">
	    <ul class="table-list-ul">
	      <li>핀번호</li>
	      <li>금액</li>
	      <li>성공여부</li>
	      <li>실패이유</li>
	    </ul>
	    
	    <c:forEach items="${listHelper.list}" var="list" varStatus="status">
		    <ul class="table-list-ul">
		      	<li><c:out value="${list.FIN_NUMBER}" /></li>
		        <li><fmt:formatNumber value="${list.REQ_MONEY }" pattern="#,###" /></li>
		        <li><input type="checkbox" <c:if test="${list.SUCCESS_YN eq 'Y' }">checked</c:if> ><span class="icon-chk"></span></li>
		        <li>
		        	<c:choose>
		        		<c:when test="${list.SUCCESS_YN eq 'Y' }">-</c:when>
		        		<c:otherwise><c:out value="${list.FAIL_REASON}" /></c:otherwise>
		        	</c:choose>
		        </li>
		    </ul>
	    </c:forEach>
	    
	    <div class="pageSection">
	      <ndn:paging listHelper="${listHelper}"/>
	    </div>
	  </div>
    
    <div class="memo-form">
      <div class="memo-header">메모</div>
      <div>
      	<textarea name="contents" id="contents" cols="40" rows="30" ><c:out value="${detail.LARGE_CONTENTS}" escapeXml="false"/></textarea>
      	<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "contents",
				sSkinURI : "/smarteditor/SmartEditor2Skin.html",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,
					fOnBeforeUnload : function() {
					},
				}
			});
		</script>
      </div>
      <div class="gray-btn save-btn"><button type="button" class="gray-btn" onclick="fn_contents()"> 저장</button></div>
    </div>
</form>    
</body>

</html>