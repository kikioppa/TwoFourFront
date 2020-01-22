<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="robots" content="noindex, nofollow">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title>관리자 페이지-회원리스트</title>
  <script type="text/javascript">
 	function go_paging(page){
		$("#curPage").val(page);
		$("#frm").submit();
	}
 	function go_search(){
 		$("#curPage").val("1");
 		$("#frm").attr("action", "");
 		$("#frm").submit();
 	}	
 	function go_view(seq) {
 		$("#seq").val(seq);
 		$("#frm").attr("action" , 'detail.do');
 		$("#frm").submit();
 	}
  </script>
</head>

<body>
  <div class="contWarp">
    <div class="contents noTab">
      <!-- contents  -->
      <form id="frm" name="frm" method="post">
      	<input type="hidden" id="curPage" name="curPage" value="" />
      	<input type="hidden" id="seq" name="seq" value="" />
        <div class="conditionSearch">
        
        
          <div class="conditions" >
           
           
             <dl>   
              <dt>가입일 조회 </dt>
              
              <dd>
         
                <input type="radio" name="createdDate" value="today" id="today" <c:if test="${param.createdDate eq 'today' }">checked</c:if> >당일
              </dd>
              <dd>
                <input type="radio" name="createdDate" value="weekly" id="weekly" <c:if test="${param.createdDate eq 'weekly' }">checked</c:if> >1주일
              </dd>
              <dd>
                <input type="radio" name="createdDate" value="monthly" id="monthly" <c:if test="${param.createdDate eq 'monthly' }">checked</c:if>>1개월
              </dd>
              <dd>
                <input type="radio" name="createdDate" value="threeMonthly" id="threeMonthly" <c:if test="${param.createdDate eq 'threeMonthly' }">checked</c:if> >3개월
              </dd>
              <dd>
                <input type="radio" name="createdDate" value="datePick" id="datePick" <c:if test="${param.createdDate eq 'datePick' }">checked</c:if>>
                	날짜지정 <input type="date" name="startDate" id="startDate" value= '${param.startDate }' />~<input type="date" name="endDate" id="endDate" value='${param.endDate }' />
              </dd>
            </dl>
            
             <dl>
              <dt>메일수신</dt>
              <dd>
                <select name="mailYn" id="mailYn">
                  <option value="" <c:if test="${param.mailYn eq '' }">selected</c:if> >전체</option>
                  <option value="Y" <c:if test="${param.mailYn eq 'Y' }">selected</c:if> >허용</option>
                  <option value="N" <c:if test="${param.mailYn eq 'N' }">selected</c:if> >거부</option>
                </select>
              </dd>
              <dt>계좌인증</dt>
              <dd>
                <select name="confirmYn" id="confirmYn">
                  <option value="" <c:if test="${param.confirmYn eq '' }">selected</c:if> >전체</option>
                  <option value="Y" <c:if test="${param.confirmYn eq 'Y' }">selected</c:if> >인증완료</option>
                  <option value="N" <c:if test="${param.confirmYn eq 'N' }">selected</c:if> >인증대기</option>
                </select>
              </dd>
            </dl>
            <dl>
              <dt>카테고리</dt>
              <dd>
                <select name="searchCondition" id="searchCondition">
                  <option value="" <c:if test="${param.searchCondition eq '' }">selected</c:if> >목록</option>
                  <option value="memberName" <c:if test="${param.searchCondition eq 'memberName' }">selected</c:if> >이름</option>
                  <option value="memberId" <c:if test="${param.searchCondition eq 'memberId' }">selected</c:if> >아이디</option>
                </select>
              </dd><dt>아이디검색</dt>
              <dd><input type="text" name="searchKeyword" id="searchKeyword" size="30" value="<c:out value='${param.searchKeyword }' />"></dd>
            </dl>
          </div>
      
		    <div class="searchBtns ">
          
            <button type="button" name ="searchKeyword" id="searchKeyword" onclick="go_search(); " class="btnSearchLarge " value=<c:out value="${param.searchKeyword}"/>>조회</button>
          </div>
        </div>
        <table class="tableSt_01 ">
          <colgroup>
            <col style="width:100px; ">
            <col style="width:100px; ">
            <col style="width:100px; ">
            <col style="width:100px; ">
            <col style="width:150px; ">
            <col style="width:150px; ">
          </colgroup>
          <thead>
            <tr>
              <th>목록번호</th>
              <th>이메일</th>
              <th>이름</th>
              <th>계좌인증</th>
              <th>SMS</th>
              <th>가입일시</th>
            </tr>
          </thead>
          <tbody>
          
          <c:forEach items="${listHelper.list}" var="list" varStatus="status">
         
            <tr class="mainNotice ">
<%-- 	            <td><c:out value="${list.MEMBER_NO }"/></td> --%>
	            <td><c:out value="${list.rownum }"/></td>
<!--<td onclick=" " style="cursor:pointer "><c:out value="${list.MEMBER_MAIL_ADDR }"/> </td>-->
				<td class="taL">
								<a href="javascript:go_view('<c:out value="${list.MEMBER_NO }" />')" class="link">
									<c:out value="${list.MEMBER_MAIL_ADDR}" /> 
								</a>
				<td><c:out value="${list.MEMBER_NAME}"/></td>
				<td>
			<c:choose>
	        	<c:when  test="${list.CONFIRM_YN eq 'Y' }"> 인증완료 </c:when>
	        	<c:otherwise > 인증대기</c:otherwise>
        	</c:choose>
        	</td>
        	<td><c:out value="${list.MEMBER_PHONE}"/></td>
				<td><c:out value="${list.CREATION_DATE}"/></td>
            </tr>
            
            </c:forEach>
					<c:if test="${empty listHelper.list}">
						<tr><td colspan="6">데이터가 없습니다.</td></tr>
					</c:if>
          </tbody>
        </table>
        <div class="pageSection ">
          <ndn:paging listHelper="${listHelper}"/>
        </div>
      </form>
    </div>
  </div>
</body>

</html>