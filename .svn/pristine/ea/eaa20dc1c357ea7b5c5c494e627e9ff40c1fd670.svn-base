<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp"%>

<head>
  <title>공지사항 상세</title>
  <script type="text/javascript">
	function go_view(noticeId, rownum) {
		$("#frm").attr("action" , "detail.do");
		$("#noticeId").val(noticeId);
		$("#rownum").val(rownum);
		$("#frm").submit();
	}
	</script>
</head>

<body>
  <!--section-->
  <div class="section">
    <div class="section-main notice-view">
      <h2>공지사항</h2>
      <table class="view-table">
        <tr class="list-title urgent">
          <!-- urgent는 긴급공지때 사용된 css 클래스명-->
          <td class="number">점검</td>
          <td class="title"><c:out value='${detail.title}'/></td>
          <td class="sub">
            <p class="writer"><c:out value='${detail.creation_user}'/></p>
            <div></div>
            <p class="date"><fmt:formatDate value="${detail.creation_date}" pattern="yyyy-MM-dd"/></p>
          </td>
        </tr>
        <c:if test="${not empty detail.ORIGNL_FILE_NM}">
	        <tr class="file">
	          <td colspan="3">
	            <a href="javascript:fn_ListdownFileUser('<c:out value="${detail.atch_file_id}"/>','<c:out value="${detail.FILE_SN}"/>')"  class="fileDown">
	            	<img src="${web_server_url}/images/front/notice-view-forma.png" alt="파일첨부 클립 이미지">
	            	<c:out value='${detail.ORIGNL_FILE_NM}'/>
	            </a>
	          </td>
	        </tr>
        </c:if>
        <tr class="contents">
          <td colspan="3"><c:out value='${detail.contents}' escapeXml="false"/></td>
        </tr>
      </table>
      <div class="list-mv">
        <div class="re-list">
          <a href="/board/notice/list.do">목록</a>
        </div>
        <ul class="link">
          <li>
            <ul>
              <li><img src="${web_server_url}/images/front/up.png" alt="페이징 화살표 이미지">다음글</li>
              <li class="border"></li>
              <li><a href="javascript:go_view(<c:out value='${next.seq}'/>, <c:out value='${next.rownum}'/>)"><c:out value="${next.title}"/></a></li>
            </ul>
            <ul>
              <li><img src="${web_server_url}/images/front/down.png" alt="페이징 화살표 이미지">이전글</li>
              <li class="border"></li>
              <li><a href="javascript:go_view(<c:out value='${prev.seq}'/>, <c:out value='${prev.rownum}'/>)"><c:out value="${prev.title}"/></a></li>
            </ul>
          </li>
          <li></li>
        </ul>
      </div>
    </div>
  </div>
	  <form action="" name="frm" id="frm" method="post">
	  	<input type="hidden" name="noticeId" id="noticeId" value="">
	  	<input type="hidden" name="rownum" id="rownum" value="">
  	  </form>
</body>
