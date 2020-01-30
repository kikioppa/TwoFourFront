<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/jsp/common/jstlcore.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>개인정보수정</title>
  <script src="http://malsup.github.com/jquery.form.js"></script> 
  <link rel="stylesheet" href="../css/style.css">

  <script src="../js/jquery/jquery-1.12.4.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="../js/script.js"></script>

</head>

<body>
  
  <div class="section">
    <div class="wrapper">
      <div class="buy-header">
        <h1>개인정보수정</h1>
      </div>
      <div class="user-info">
        <h2>회원정보</h2>
        <table>
          <colgroup>
            <col style="width: 150px;">

          </colgroup>
          <tr class="thead">
            <td>아이디</td>
            <td><c:out value="${memberInfo.MEMBER_MAIL_ADDR}"/></td>
          </tr>				
          <tr>
            <td>이름</td>
            <td><input type="text" value="<c:out value="${memberInfo.MEMBER_MAIL_ADDR}"/>"id="memberName" name="memberName" disabled><br></td>
          </tr>
          <tr>
            <td>새비밀번호</td>
            <td>
            	<input id="memberPw" name="memberPw" type ="password" placeholder="비밀번호를 입력하세요.">
            </td>
          </tr>
          <tr>
            <td>비밀번호 확인</td>
            <td>
            	<input id="memberPw2" name = "memberPw2" type="password" placeholder="비밀번호 확인합니다.">
            </td>
          </tr>
          <tr>
            <td>휴대폰 번호</td>
            <td><input type="text" value="${sessionScope.cellphone}" class="phone-number-check"><button type="button">인증하기</button>
            </td>
            <tr class="text-td">
              <td></td>
              <td>
                <p>*비밀번호는 영문/숫자/특수문자/ 3가지 이상 조합해서 최소 6자~12자</p>
                <p>*입력하신 휴대폰번호와 이메일(아이디)로 주요공지사항 및 이벤트에 대한 안내를 받을 수 있습니다.</p>
                <p>*거래정보와 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.</p>
              </td>
            </tr>
            <tr class="agree-select">
              <td>SMS 수신동의</td>
              <td>
                <div class="radio-wrap">
                  <input type="radio" id="radio01" name="radio">
                  <span class="icon-radio"></span>
                  <label for="radio01">동의함</label>
                </div>
                <div class="radio-wrap">
                  <input type="radio" id="radio02" name="radio">
                  <span class="icon-radio"></span>
                  <label for="radio02">동의안함</label>
                </div>
              </td>
            </tr>
            <tr class="agree-select">
              <td>이메일 수신동의</td>
              <td>
                <div class="radio-wrap">
                  <!--선택이 되어있을때-->
                  <input type="radio" id="radio03" name="radio2" checked="checked">
                  <span class="icon-radio"></span>
                  <label for="radio03">동의함</label>
                </div>
                <div class="radio-wrap">
                  <input type="radio" id="radio04" name="radio2">
                  <span class="icon-radio"></span>
                  <label for="radio04">동의안함</label>
                </div>
              </td>
            </tr>
        </table>
        <div class="user-info-btn">
          <button>회원탈퇴</button>
          <button>개인정보 수정</button>
        </div>
      </div>
    </div>
  </div>
</body>

</html>