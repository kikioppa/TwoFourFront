//이용약관
function pop() {
  var $width = parseInt($(".popup").css("width"));
  var $height = parseInt($(".popup").css("height"));
  var left = ($(window).width() - $width) / 2;
  var sctop = $(window).scrollTop() * 2;
  var top = ($(window).height() - $height + sctop) / 2;
  var height = document.getElementsByTagName("body")[0].scrollHeight;
  $(".popup").css("left", left);
  $(".popup").css("top", top);
  $(".popup").css("display", "block");
  $(".popup").css("z-index", "555");
  $(".popback").css("display", "block");
  $(".popback").css("width", $(window).width());
  $(".popback").css("height", "100%");

}

function close1(lay1, lay2) {
  $("." + lay1).css("display", "none");
  $("." + lay2).css("display", "none");
}
//개인정보처리
//이용약관
function pop2() {
  var $width = parseInt($(".popup2").css("width"));
  var $height = parseInt($(".popup2").css("height"));
  var left = ($(window).width() - $width) / 2;
  var sctop = $(window).scrollTop() * 2;
  var top = ($(window).height() - $height + sctop) / 2;
  var height = document.getElementsByTagName("body")[0].scrollHeight;
  $(".popup2").css("left", left);
  $(".popup2").css("top", top);
  $(".popup2").css("display", "block");
  $(".popup2").css("z-index", "555");
  $(".popback").css("display", "block");
  $(".popback").css("width", $(window).width());
  $(".popback").css("height", "100%");

}

function close2(lay1, lay2) {
  $("." + lay1).css("display", "none");
  $("." + lay2).css("display", "none");
}
//form
function check1() {
  if (f1.id.value == "") {
    // alert("아이디를 입력해주세요.");
    document.getElementById('id').innerHTML = '아이디를 입력해주세요.';
    return false;
    f1.id.focus();
  } else if (f1.pwd.value == "") {
    document.getElementById('pwd').innerHTML = '비밀번호를 입력해주세요.';
    return false;
    f1.pwd.focus();
  } else if (f1.pwd2.value == "") {
    document.getElementById('pwd2').innerHTML = '비밀번호를 확인해주세요.';
    return false;
    f1.pwd2.focus();
  } else if (f1.pwd.value != f1.pwd2.value) {
    document.getElementById('pwd2').innerHTML = '비밀번호가 같지 않습니다. 다시 입력해주세요';
    return false;
    f1.pwd2.focus();
  } else if (f1.name.value == "") {
    document.getElementById('name').innerHTML = '이름을 입력해주세요.';
    return false;
    f1.name.focus();
  } else if (f1.phone.value == "") {
    document.getElementById('phone').innerHTML = '휴대전화를 입력해주세요.';
    return false;
    f1.phone.focus();
  } else if (!f1.ckbox1.checked) {
    alert('이용약관에 동의 해주세요.');
    return false;
  } else if (!f1.ckbox2.checked) {
    alert('개인정보처리방침에 동의 해주세요.');
    return false;
  } else {
    alert("회원가입 완료되었습니다.");
    return true;
  }
};

function check2() {
  if (!f2.ckbox3.checked) {
    alert('개인정보처리방침에 동의해주세요');
    return false;
  } else if (!f2.ckbox4.checked) {
    alert('매입 서비스 이용조건 및 매입 진행 동의에 동의해주세요');
    return false;
  } else {
    alert('매입신청이 완료되었습니다.')
    return true;
  }
};
//check 이미지 클릭시 변경
function check(e) {
  var dama = e.childNodes[0]
  if (dama.src.match("ck-icon2")) {
    dama.src = "/images/front/ck-icon.png";
  } else {
    dama.src = "/images/front/ck-icon2.png";
  }
};


//table tr추가
var ccount = 10;

function addrow() {
  ccount++;
  var oRowa = row_add.insertRow();
  oRowa.onmouseover = function() {
    row_add.clickedRowIndex = this.rowIndex
  };
  var td1 = oRowa.insertCell();
  var td2 = oRowa.insertCell();

  td1.innerHTML =
    '<td>' + ccount + '</td>';

  td2.innerHTML =
    // "<td>" + ccount + "행";
    '<td><input type="text " maxlength="4" onkeypress="nolang();">' +
    '-' +
    '<input type="text " maxlength="4" onkeypress="nolang();">' +
    '-' +
    '<input type="text " maxlength="4" onkeypress="nolang();">' +
    '-' +
    '<input type="text " maxlength="6" onkeypress="nolang();"></td>';
}

var count = 10;

function addrow2() {
  count++;
  var oRowa = row_add2.insertRow();
  oRowa.onmouseover = function() {
    row_add2.clickedRowIndex = this.rowIndex
  };
  var td11 = oRowa.insertCell();
  var td22 = oRowa.insertCell();

  td11.innerHTML =
    '<td>' + count + '</td>';

  td22.innerHTML =
    '<td><input type="text " maxlength="4" onkeypress="nolang();">' +
    '-' +
    '<input type="text " maxlength="4" onkeypress="nolang();">' +
    '-' +
    '<input type="text " maxlength="4" onkeypress="nolang();">' +
    '-' +
    '<input type="text " maxlength="4" onkeypress="nolang();"></td>';
}
//radio 버튼
$(document).ready(function() {
  $(".container .label1").click(function() {
    if ($(".radio1").is(":visible")) {
      $(".radio1").css("display", "block");
      $(".radio2").css("display", "none");
      $(".table-add").css("display", "block");
      $(".table-add2").css("display", "none");
    } else {
      $(".radio1").css("display", "block");
      $(".radio2").css("display", "none");
      $(".table-add").css("display", "block");
      $(".table-add2").css("display", "none");
    }
  });
});
$(document).ready(function() {
  $(".container .label2").click(function() {
    if ($(".radio2").is(":visible")) {
      $(".radio2").css("display", "block");
      $(".radio1").css("display", "none");
      $(".table-add").css("display", "none");
      $(".table-add2").css("display", "block");
    } else {
      $(".radio2").css("display", "block");
      $(".radio1").css("display", "none");
      $(".table-add").css("display", "none");
      $(".table-add2").css("display", "block");
    }
  });
});