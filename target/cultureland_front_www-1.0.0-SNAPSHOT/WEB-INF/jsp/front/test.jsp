<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://auth.logintalk.io/js/logintalk.js"></script>
<script>
function fn_test(){
	
	var options = {
	  key: "stMyAHwTh",
	  service:4,
	  auto:false,
	  verify:true,
	  user:$("#tel").val()
 	  ,action: "http://127.0.0.1:8092/test2.do"
	  
	};
	logintalk(options);
	
	function cb(token){
		console.log("token : " + token);
		$("#token").val(token);
		$("#frm").attr('action','/test2.do');
		$("#frm").submit();
	}
	logintalk.callback(cb);
}
</script>

</head>
<body>
<form name="frm" id="frm" method="post">
<input type="hidden" name="token" id="token" value="" />
<!-- <input type="text" name="tel" id="tel" value="01063765509" /> -->
<input type="text" name="tel" id="tel" value="01044951809" />
테스트123
<!-- <button name="logintalk_ars2" data-tel="01063765509">ARS 인증11</button> -->
<button type="button" onclick="fn_test()">본인인증601</button>
</form>
</body>
</html>