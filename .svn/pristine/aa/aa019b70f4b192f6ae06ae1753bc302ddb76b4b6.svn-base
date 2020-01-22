<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<html>
<head>
<title>계정관리</title>
<script type="text/javascript" src="${web_server_url}/js/core.min.js"></script>
<script type="text/javascript" src="${web_server_url}/js/sha256.min.js"></script>
<script>



$(document).ready(function() {
	$("#allChk").click(function() {
	    if($(this).is(':checked')) {
			$("input[name='seqArray']").prop("checked", true);
	    } else {
	    	$("input[name='seqArray']").prop("checked", false);
	    }
	});	
	
});



//체크되어 있는지
function checkedValid(){
	var returnStr = true;
	
	var checkedCount =  $("input:checkbox[name=seqArray]:checked").length;
	if ( checkedCount == 0){
		alert('선택해주세요.');
		returnStr = false;
	}
	
	return returnStr;
}

function fn_write(){
	if ( isValid() && confirm("저장하시겠습니까?")){
		$("#pwd").val(CryptoJS.SHA256(pwEncode($('#id').val().trim(), $('#in_pwd').val().trim())).toString());
		$("#tel").val($("#tel1").val() + '-' + $("#tel2").val() + '-' + $("#tel3").val());
		$("#cellphone").val($("#phone1").val() + '-' + $("#phone2").val() + '-' + $("#phone3").val());
			var option = {
					type : "post",
					url: './write_proc.json',
					data: $("#accFrm").serialize() ,
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
		
				$("#accFrm").ajaxSubmit(option);
					
	}
}

function isValid(){
	var returnStr = true;
	
	if(  returnStr  &&  trimNvl( $("#id").val() )){
		alert('아이디를 입력해 주십시요');
		$('#id').focus();
		returnStr = false;
	}
	
	if(  returnStr  &&  trimNvl( $("#in_pwd").val() )){
		alert('비밀번호를 입력해 주십시요');
		$('#in_pwd').focus();
		returnStr = false;
	}
	
	if(  returnStr  &&  trimNvl( $("#in_pwd_re").val() )){
		alert('비밀번호 확인을 입력해 주십시요');
		$('#in_pwd_re').focus();
		returnStr = false;
	}	
	
	if($("#in_pwd_re").val() != ''){
		if($("#in_pwd").val() != $("#in_pwd_re").val()){
			alert('비밀번호가 일치하지 않습니다.');
			$('#in_pwd').focus();
			returnStr = false;
		}
		
	}
	
	if(  returnStr  &&  trimNvl( $("#name").val() )){
		alert('이름을 입력해 주십시요');
		$('#name').focus();
		returnStr = false;
	}
	
	return returnStr;	
}

function fn_update(){
	if ( isValid2() && confirm("저장하시겠습니까?")){
// 		$("#pwd").val(CryptoJS.SHA256(pwEncode($('#id').val().trim(), $('#in_pwd').val().trim())).toString());
		$("#tel").val($("#tel1").val() + '-' + $("#tel2").val() + '-' + $("#tel3").val());
		$("#cellphone").val($("#phone1").val() + '-' + $("#phone2").val() + '-' + $("#phone3").val());
			var option = {
					type : "post",
					url: './write_proc.json',
					data: $("#accFrm").serialize() ,
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
		
				$("#accFrm").ajaxSubmit(option);
					
	}
}

function isValid2(){
	var returnStr = true;
	
	if(  returnStr  &&  trimNvl( $("#name").val() )){
		alert('이름을 입력해 주십시요');
		$('#name').focus();
		returnStr = false;
	}
	
	return returnStr;	
}

function fn_passCh(){
	if ( isPassValid() && confirm("비밀번호 변경을 하시겠습니까?")){
		$("#pwd").val(CryptoJS.SHA256(pwEncode($('#id').val().trim(), $('#in_pwd').val().trim())).toString());
			var option = {
					type : "post",
					url: './write_pass_proc.json',
					data: $("#accFrm").serialize() ,
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
		
				$("#accFrm").ajaxSubmit(option);
					
	}
}

function isPassValid(){
	var returnStr = true;
	
	if(  returnStr  &&  trimNvl( $("#in_pwd").val() )){
		alert('비밀번호를 입력해 주십시요');
		$('#in_pwd').focus();
		returnStr = false;
	}
	
	if(  returnStr  &&  trimNvl( $("#in_pwd_re").val() )){
		alert('비밀번호 확인을 입력해 주십시요');
		$('#in_pwd_re').focus();
		returnStr = false;
	}	
	
	if($("#in_pwd_re").val() != ''){
		if($("#in_pwd").val() != $("#in_pwd_re").val()){
			alert('비밀번호가 일치하지 않습니다.');
			$('#in_pwd').focus();
			returnStr = false;
		}
		
	}
	
	return returnStr;	
}

//삭제
function fn_del(seq){
	$("#seq").val(seq);	
	if( confirm("삭제하시겠습니까?")){
		
		$.ajax({
			type : "post",			
			url : "del_proc.json",
			dataType : 'json',
			data: $('form#frm').serialize() ,
			
			success : function(data) {
				$('#ajax_load_indicator').hide();			
				
				if ( data.success){
					alert("정상적으로 삭제하였습니다.");
					window.location.reload();
				}else{
					alert(data.message);
				}
			
			}
		});
		
	}
}


function go_view(seq, rownum) {
	$("#frm").attr("action" , "write.do");
	$("#seq").val(seq);
	$("#rownum").val(rownum);
	$("#frm").submit();
}	

function go_search(){
	
	$("#curPage").val("1");
	$("#frm").attr("action", "");
	$("#frm").submit();
}	

function go_paging(page){
	$("#curPage").val(page);
	$("#frm").submit();
}

function go_write(){
	$.ajax({
		type : "post",			
		url : "writeTemplate.do",
		dataType : 'html',
		data: $('form#frm').serialize() ,
		
		success : function(data) {
			$("#accountForm").html(data);

			$( "#dialog-account" ).dialog({
			      resizable: false,
			      height: "auto",
			      width: 450,
			      title: "관리자 정보 관리",
			      modal: true,
			     
			      buttons: {

			        "저장": function() {
			        	
			        	fn_write();
			        	
			        },
			        "취소": function() {	        	
			          	 $( this ).dialog( "close" );
			        }
			      }
			    });
		}
	});
	
	
}

function go_view(seq){
	$("#seq").val(seq);
	
	$.ajax({
		type : "post",			
		url : "writeTemplate.do",
		dataType : 'html',
		data: $('form#frm').serialize() ,
		
		success : function(data) {
			$("#accountForm").html(data);

			$( "#dialog-account" ).dialog({
			      resizable: false,
			      height: "auto",
			      width: 450,
			      title: "관리자 정보 관리",
			      modal: true,
			     
			      buttons: {

			        "비밀번호변경": function() {
			        	
			        	fn_passCh();
			        	
			        },
			        "저장": function() {
			        	
			        	fn_update();
			        	
			        },
			        "취소": function() {	        	
			          	 $( this ).dialog( "close" );
			        }
			      }
			    });
		}
	});
	
	
}

</script>
</head>
<body>

	<div class="contWarp">
		<div class="contents noTab">
			<!-- contents  -->
			<form method="post" action="" name="frm" id="frm">
			<input type="hidden" id="curPage"  name="curPage" value="<c:out value="${param.curPage}"   default="1"  escapeXml="false" />" />
			<input type="hidden" id="seq"  name="seq" value="" />
			<input type="hidden" id="rownum"  name="rownum" value="" />
			
			<table class="tableSt_01">
				<colgroup>
					<col style="width:50px;" />
					<col style="width:100px;" />
					<col style="width:100px;" />
					<col />
					<col style="width:100px;" />
					<col style="width:100px;" />
					<col style="width:100px;" />
					<col style="width:150px;" />
					
					
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>						
						<th>ID</th>						
						<th>LEVEL</th>						
						<th>이름</th>
						<th>부서</th>
						<th>직통전화</th>
						<th>핸드폰</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
								
					<c:forEach items="${listHelper.list}" var="list" varStatus="status">						
						<tr class="mainNotice">
							<td><c:out value="${list.rownum}"/></td>
							<td onclick="go_view('<c:out value="${list.seq}"/>')" style="cursor:pointer">
								<c:out value="${list.id}"/>
							</td>
							<td>
								<c:choose>
									<c:when test="${list.auth_level eq 'AUTH2' }">스태프</c:when>
								</c:choose>
							</td>
							<td><c:out value="${list.name}"/></td>
							<td><c:out value="${list.position}"/></td>
							<td><c:out value="${list.tel}"/></td>
							<td><c:out value="${list.cellphone}"/></td>
							<td>
								<button type="button" onclick="fn_del('<c:out value="${list.seq }"/>');" class="btn type_02 leftBtn">삭제</button>
							</td>
						</tr>
					</c:forEach>
					
					<c:if test="${empty listHelper.list}">
						<tr>
							<td colspan="8">
								<div class="resultNothing">
									<p>등록 계정이 없습니다.</p>									
								</div>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div class="pageSection">

				<ndn:paging listHelper="${listHelper}"/>

				<div class="btnSec ">
					<button type="button" onclick="go_write();" class="btn type_01 rightBtn">등록</button>
				</div>	
						
			</div>			
<!-- 			<div class="searchSection"> -->
<!-- 				<select name="searchCondition" id="searchCondition"> -->
<%-- 					<option value="total" <c:if test="${empty param.searchCondition || param.searchCondition eq 'title'}">selected</c:if>>전체</option> --%>
<%-- 					<option value="title" <c:if test="${param.searchCondition eq 'title'}">selected</c:if>>제목</option> --%>
<%-- 					<option value="content" <c:if test="${param.searchCondition eq 'content'}">selected</c:if>>내용</option> --%>
					
<!-- 				</select> -->
<%-- 				<input type="text" name="searchKeyword" id="searchKeyword" value="<c:out value="${param.searchKeyword}"/>"> --%>
<!-- 				<button type="button" onclick="go_search();"  class="btn">검색</button> -->
<!-- 			</div> -->
			
			<!-- //contents  -->
			</form>
		</div>
	</div>
	
	<div id="dialog-account">
	  <div id="accountForm">
	  		
	  </div>
</div>

</body>