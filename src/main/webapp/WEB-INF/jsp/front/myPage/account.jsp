<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>계좌인증</title>
  <link rel="stylesheet" href="../css/style.css">

  <script src="../js/jquery/jquery.min.js"></script>
  <script src="../js/script.js"></script>
</head>

<body>
  
  <div class="section">
    <div class="wrapper">
      <div class="buy-header">
        <h1>계좌인증</h1>
      </div>
      <div class="certify-info">
        <table>
          <colgroup>
            <col style="width: 100px;">
          </colgroup>
          <tr>
            <td>은행형</td>
            <td><select><option>선택하세요</option></select></td>
          </tr>
          <tr>
            <td>예금주</td>
            <td><input type="text" readonly="readonly"> </td>
          </tr>
          <tr>
            <td>계좌번호</td>
            <td><input type="text"></td>
          </tr>
        </table>
        <div class="certify-btn">
          <input type="button" value="취소">
          <input type="button" value="인증요청">
        </div>
      </div>
    </div>
  </div>


</body>

</html>