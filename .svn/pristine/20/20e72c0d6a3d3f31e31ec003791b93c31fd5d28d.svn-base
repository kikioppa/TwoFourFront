<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

var img_w = '${imgvo.img_width}';
	if ('${imgvo.img_name}' == '') {
		alert('업로드 중 오류가 발생하였습니다.\n파일의 최대 크기는 2MB 입니다.');
		parent.fn_callback_commonImageUploadForEditor("");
	} else {
		if(img_w > 750)
			//parent.Util._editor.innerHTML("<img src='${imgvo.img_url}' width=750>");
			parent.Util._editor.innerHTML("<img src='${imgvo.img_url}' style='max-width:100%;' >");
		else
			parent.Util._editor.innerHTML("<img src='${imgvo.img_url}' style='max-width:100%;' >");
		parent.fn_callback_commonImageUploadForEditor("${imgvo.img_name}.${imgvo.img_ext}");
	}
</script>
