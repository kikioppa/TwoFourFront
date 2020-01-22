<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<form id="passFrm" name="passFrm">
	<table class="tableSt_01">
			<colgroup>
				<col style="width:100px;" />
				<col style="width:250px;" />
				
			</colgroup>
			<tr>
							
			<td>아이디</td>
				<td class="left">
					<c:out value="${detail.id }" />
					<input type="hidden" name="seq" value="" />
					<input type="hidden" name="infoSeq" value="<c:out value="${detail.seq }" />" />
					<input type="hidden" id="userPwd" name="userPwd" value="" />
					<input type="hidden" name="tel" value="" />
					<input type="hidden" name="cellphone" value="" />
					<input type="hidden" id="userId" name="userId" value="${detail.id }" />
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td class="left"><input type="password" id="in_pwd" name="in_pwd" value=""  style="height: 30px" maxlength="12"/></td>
			</tr>
			
			<tr>
				<td>비밀번호 확인</td>
				<td class="left"><input type="password" id="in_pwd_re" name="in_pwd_re" value=""  style="height: 30px" maxlength="12"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td class="left"><input type="text" id="name" name="name" value="<c:out value="${detail.name }" />"  style="height: 30px" maxlength="25"/></td>
			</tr>
			<tr>
				<td>부서</td>
				<td class="left"><input type="text" id="position" name="position" value="<c:out value="${detail.position }" />"  style="height: 30px" maxlength="25"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td class="left"><input type="text" id="email" name="email" value="<c:out value="${detail.email }" />"  style="height: 30px" maxlength="50"/></td>
			</tr>
			<tr>
				<td>핸드폰</td>
				<td class="left">
					<c:set var="phoneSplit" value="${fn:split(detail.cellphone,'-') }" />
					<input type="text" name="phone1" value="<c:out value="${phoneSplit[0]}" />"  style="height: 30px;width: 86px;" maxlength="3"/>-
					<input type="text" name="phone2" value="<c:out value="${phoneSplit[1]}" />"  style="height: 30px;width: 86px;" maxlength="4"/>-
					<input type="text" name="phone3" value="<c:out value="${phoneSplit[2]}" />"  style="height: 30px;width: 86px;" maxlength="4"/>
				</td>
			</tr>
			<tr>
				<td>직통전화</td>
				<td class="left">
					<c:set var="telSplit" value="${fn:split(detail.tel,'-') }" />
					<input type="text" name="tel1" value="<c:out value="${telSplit[0]}" />"  style="height: 30px;width: 86px;" maxlength="4"/>-
					<input type="text" name="tel2" value="<c:out value="${telSplit[1]}" />"  style="height: 30px;width: 86px;" maxlength="4"/>-
					<input type="text" name="tel3" value="<c:out value="${telSplit[2]}" />"  style="height: 30px;width: 86px;" maxlength="4"/>
				</td>
			</tr>
			</tbody>
			</table>
			</form>
