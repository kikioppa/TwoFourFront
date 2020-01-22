<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<c:set var="serverName"  value="${pageContext.request.serverName}"  />
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss"  var="nowDate" />
<%
response.setHeader("Cache-Control","no-store"); //뒤로가기 막기 완료된페이지
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
if(request.getProtocol().equals("HTTP/1.1")){
 response.setHeader("Cache-Control","no-store");
}
%>
<!Doctype HTML>
<html lang="ko">
<head>
<link rel="Shortcut Icon" href="${web_server_url}/images/favicon.ico" />
<script type="text/javascript" src="${web_server_url}/js/jquery-1.11.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="ROBOTS" content="NOINDEX,NOFOLLOW">
<meta name="GOOGLEBOT" content="NOINDEX,NOFOLLOW">
<meta name="ROBOTS" content="NOARCHIVE">
<meta name="GOOGLEBOT" content="NOARCHIVE">
<title>Error</title>
<script src="/js/jquery-1.11.3.min.js"></script>
<style id="style">
* html #body { 
	height: 100%; }
 
html, body { 
	height: 100%; 
	margin: 0; 
	padding: 0 5px; 0 8px;
    font-size: 12px;
    line-height: 16px;
    text-decoration: none;
    word-break: break-all;
}

.table_header_complex_d {
    background-color: #ECE8EE;
    text-align: right;
    font-family: "Tahoma";
    font-size: 11px;
    color: #555;
    font-weight: bold;
    padding: 1px 6px 1px 2px;
}
.table_padding {
    height: 22px;
    padding: 2px 2px 1px 3px;
    background-color: #FFF;
}
.table_line_complex {
    background-color: #D0D0D0;
}
.table_layout {
    clear: both;
    font-size: 11px;
    border-top: 2px solid #8DAFB1;
    padding: 0px;
    margin: 0px 0px 7px 0px;
}

.send_button{
	border: 1px solid #eee;
    padding: 5px;
    border-radius: 5px;
}
.send_button a{
	text-decoration:none;
	color:gray;
}
</style>
<script>
function confirm(){
	location.href="/";
}

function sendmail(){
		
	  win = window.open();
	  self.focus();
	  win.document.open();
	  win.document.write('<meta name="ROBOTS" content="NOINDEX,NOFOLLOW">');
	  win.document.write('<meta name="GOOGLEBOT" content="NOINDEX,NOFOLLOW">');
	  win.document.write('<meta name="ROBOTS" content="NOARCHIVE">');
	  win.document.write('<meta name="GOOGLEBOT" content="NOARCHIVE">');
	  win.document.write('<style>'+$("#style").html()+'</style>');
	  win.document.write($('#errorPage').html() );
	  
	
}
</script>
</head>
<body>
<c:if test="${ndn:getProfile() != 'prod' }" >
	<span class="send_button"><a href="javascript:sendmail();" id="send_button">에러메시지 보기</a></span>
</c:if>
 
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="450" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="162" align="center" background="${web_nomal_url }/images/error/err_bg_s.gif"><table width="330" height="90" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="11%" height="52">&nbsp;</td>
              <td width="89%" align="left" valign="top">
              <strong>일시적인 서버문제로 요청하신 서비스가 정상 처리되지 않았습니다.</strong>
              </td>
            </tr>
            <tr>
              <td height="20" colspan="2" align="center"><a href="javascript:confirm();"><img src="${web_nomal_url }/images/error/btn_ok.gif" width="45" height="21" border="0" /></a></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

<div style="display:none;" >
	<div id="errorPage">
	    <h1>Error Page</h1>
	    <p>Application has encountered an error. Please contact support on ...</p>
	    
	    <div id="idDiv" style="width:900px;position: relative;" class="table_layout">
	    <table width="100%" border="0" cellspacing="1" cellpadding="0"  class="table_line_complex">
	      <colgroup>
	      <col width="100px"/>
	      <col width="200px"/>
	      <col width="100px"/>
	      <col width="200px"/>
	      </colgroup>
	      <tr>
	        <td class="table_header_complex_d">Host</td>
	        <td class="table_padding">${serverName}</td>
	        <td class="table_header_complex_d">Client</td>
	        <td class="table_padding">${client }</td>
	      </tr>
	      <tr>
	        <td class="table_header_complex_d">Status Code</td>
	        <td class="table_padding">${status }</td>
	        <td class="table_header_complex_d">Date & Time</td>
	        <td class="table_padding">${nowDate }</td>
	      </tr>
	    <!--<tr>
	        <td class="table_header_complex_d">Access URL</td>
	        <td class="table_padding" colspan="3">${url }</td>
	      </tr>-->
	      <tr>
	        <td class="table_header_complex_d">Exception Type</td>
	        <td class="table_padding" colspan="3">${type }</td>
	      </tr>
	      <tr>
	        <td class="table_header_complex_d">Message</td>
	        <td class="table_padding" colspan="3">${reason }</td>
	      </tr>
	      <tr>
	        <td class="table_padding" colspan="4">
<textarea ID=oStackTrace STYLE="background-color:#EAEAEA;width: 990px;height: 500px; overflow: scroll;">
<c:forEach items="${exception.stackTrace}" var="ste">  
${fn:trim(ste)} 
</c:forEach>					
</textarea>
	        </td>
	      </tr>
	    </table>
	  </div>
	</div>  
</div>
</body>
 </html>