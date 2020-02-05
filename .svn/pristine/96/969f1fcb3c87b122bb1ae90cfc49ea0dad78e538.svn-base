//gnb
$(document).ready(function() {

  // $(".gnb > li").on("mouseenter", function() {
  //   $(".gnb > li").removeClass('on');
  //   $(this).addClass('on');
  // });
  // $(".nav").on("mouseleave", function() {
  //   $(".gnb > li").not('.hover').removeClass('on');
  //   $(".hover").addClass('on');
  // });
});

function radioClick() {
  $('.icon-radio').click(function() {
    $(this).next('label').click();
  });
}
$(document).ready(function() {
  $(".fis-list .faq").click(function() {
    if ($(".fis-list").is(":visible")) {
      $(".fis-list").css("display", "none");
      $(".sec-list").css("display", "block");
    }
  });
});
$(document).ready(function() {
  $(".sec-list .not-pg").click(function() {
    if ($(".sec-list").is(":visible")) {
      $(".fis-list").css("display", "block");
      $(".sec-list").css("display", "none");
    }
  });
});
//아이디찾기
$(document).ready(function() {
//  $(".id-find .findging-id").click(function() {
//    if ($(".id-find").is(":visible")) {
//      $(".pw-find").css("display", "none");
//      $(".id-find").css("display", "block");
//    }
//  });
});
$(document).ready(function() {
//  $(".id-find .findging-pw").click(function() {
//    if ($(".id-find").is(":visible")) {
//      $(".id-find").css("display", "none");
//      $(".pw-find").css("display", "block");
//    }
//  });
});
$(document).ready(function() {
//  $(".pw-find .findging-id").click(function() {
//    if ($(".pw-find").is(":visible")) {
//      $(".id-find").css("display", "block");
//      $(".pw-find").css("display", "none");
//    }
//  });
});


// 로그인 유효성검사
function loginenter() {
  if (login.id.value == "") {
    alert("아이디(이메일)를 입력해주세요");
    login.id.focus();
    return false;
  } else if (login.pw.value == "") {
    alert("비밀번호를 입력해주세요");
    login.pw.focus();
    return false;
  }
}

//아이디 찾기 유효성검사
function idbtn() {
  if (findid.colnumber.value == "") {
    alert("전화번호를 입력해주세요");
    findid.colnumber.focus();
    return false;
  }
}

//전화번호 유효성 검사 
$(function() {

  $(".phone-number-check").on('keydown', function(e) {
    // 숫자만 입력받기
    var trans_num = $(this).val().replace(/-/gi, '');
    var k = e.keyCode;

    if (trans_num.length >= 11 && ((k >= 48 && k <= 126) || (k >= 12592 && k <= 12687 || k == 32 || k == 229 || (k >= 45032 && k <= 55203)))) {
      e.preventDefault();
    }
  }).on('blur', function() {
    if ($(this).val() == '') return;

    var trans_num = $(this).val().replace(/-/gi, '');
    if (trans_num != null && trans_num != '') {
      if (trans_num.length == 11 || trans_num.length == 10) {
        var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
        if (regExp_ctn.test(trans_num)) {
          trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");
          $(this).val(trans_num);
        } else {
          alert("유효하지 않은 전화번호 입니다.");
          $(this).val("");
          $(this).focus();
        }
      } else {
        alert("유효하지 않은 전화번호 입니다.");
        $(this).val("");
        $(this).focus();
      }
    }
  });
});