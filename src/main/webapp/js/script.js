// 상단 고정
function headerFix() {
  $(window).scroll(function() {
    var srollTop = $(this).scrollTop();
    if (srollTop == '0') {
      $('.header').removeClass('on');
    } else {
      $('.header').addClass('on');
    }
  });
}

// 서브 active 있을시에
function subCategory() {
  if ($('.pc .menu>li').hasClass("on")) {
    $('.pc').addClass('bg2');
  }
  $('.pc .menu>li').hover(function() {
    $(this).siblings('.on').addClass('cate-hide');
    $(this).parents('.pc').addClass('bg2');
  }, function() {
    $(this).siblings('.on').removeClass('cate-hide');
    if (!$('.pc .menu>li').hasClass("on")) {
      $('.pc').removeClass('bg2');
    }
  });
}

// 모바일 메뉴
function gnbOpen() {
  $(".gnb-wrap .menu-open").click(function() {
    $(".gnb-wrap").addClass('on');
  });
  $(".gnb-wrap .menu-close, .depth2 a").click(function() {
    $(".gnb-wrap").removeClass('on');
  });
  $(".mobile .menu > li > a").click(function() {
    $(this).parent('li').toggleClass('on');
  });
}

// 언어 선택
function language() {
  $(".lang").click(function() {
    $(this).toggleClass('on');
  });
  $('body').click(function(e) {
    if (!$(e.target).closest('.lang').length) {
      $(".lang").removeClass("on");
    }
  });
}

// page down
function pageDown() {
  $('.page-down').click(function() {
    var sectionTop = $(this).parents('.section').next('.section').offset().top;
    $('html, body').animate({
      scrollTop: sectionTop
    }, 500);
  });
}


// 뉴스 롤링
function newsRolling() {
  var news = $('.news-wrap');
  news.owlCarousel({
    center: true,
    items: 1,
    loop: true,
    margin: 40,
    nav: true,
    dots: true,
    autoplay: false,
    navContainerClass: 'count-nav'
  })
}

// 상단으로
function topAnchor() {
  $('.btn-top').click(function() {
    $('html, body').animate({
      scrollTop: 0
    }, 400);
  });
}

// 서브 상단버튼
function subtopAnchor() {
  $(window).scroll(function() {
    var t = $(document).scrollTop();
    var w = $('.sub-wrap').outerHeight() + $('.header').outerHeight() - $(window).outerHeight() - 20;
    if (t >= w) {
      $('.btn-top').addClass('absol');
    } else {
      $('.btn-top').removeClass('absol');
    }
    // console.log("t: " + t + ", w: " + w);
  });;
}

// contact 버튼
function contactButton() {
  $(window).scroll(function() {
    var t = $(document).scrollTop();
    var w = $('.contents-wrap , .sub-wrap').outerHeight() + $('.header').outerHeight() - $(window).outerHeight() - 60;
    if (t >= w) {
      $('.btn-contact').addClass('absol');
    } else {
      $('.btn-contact').removeClass('absol');
    }
    // console.log("t: " + t + ", w: " + w);
  });
}

// contents 버튼
function contentsButton() {
  $('.contents-btn span').click(function() {
    var index = $(this).index();
    var conTop = $('.contents-wrap .section').eq(index).offset().top;
    $('html, body').animate({
      scrollTop: conTop
    }, 500);
  });
  $(window).scroll(function() {
    var t = $(document).scrollTop();
    var sec02 = $('#s02').offset().top;
    var sec03 = $('#s03').offset().top;
    if (0 <= t && t < sec02) {
      $('.contents-btn span').eq(0).addClass('hover').siblings().removeClass('hover');
      $('.contents-btn').removeClass('color');
    } else if (sec02 <= t && t < sec03) {
      $('.contents-btn span').eq(1).addClass('hover').siblings().removeClass('hover');
      $('.contents-btn').addClass('color');
    } else {
      $('.contents-btn span').eq(2).addClass('hover').siblings().removeClass('hover');
      $('.contents-btn').addClass('color');
    }
  });
}

// 탭 (매뉴얼)
function tabContainer() {
  // tab
  $('.tab-btns a').click(function() {
    $(this).parent('li').addClass('on').siblings().removeClass('on');
    var index = $(this).parent('li').index();
    $('.tab-con .con').eq(index).addClass('on').siblings().removeClass('on');;
  });
}

// 팝업
function modalClose() {
  $('.modal .close-btn').click(function() {
    $(this).parents('.modal-wrap').removeClass('is-visible');
  });
}

function modalOpen(target) {
  $('.' + target).addClass('is-visible');
  // console.log(target);
}

// 서브 메뉴 클릭시 스크롤링, 해당위치
function subMenuScroll() {
  $('.menu > .on .depth2 li > a ').click(function() {
    var item = $(this).closest('li');
    var headerH = $('.header').height();
    var index = item.index();
    var conTop = $('.section').eq(index).offset().top - headerH;
    item.addClass('active').siblings().removeClass('active');
  });

  var a = [];
  for (i = 0; i < $('.section').length; i++) {
    var sectionTop = $('.section').eq(i).offset().top;
    a.push(sectionTop);
  }

  $(window).scroll(function() {
    var t = $(document).scrollTop() + $('.header').height() + 50;
    for (i = 0; i < a.length; i++) {
      if (a[i] <= t && t < a[i + 1]) {
        $('.pc .menu > .on .depth2 li').eq(i).addClass('active').siblings().removeClass('active');
        $('.mobile .menu > .active .depth2 li').eq(i).addClass('active').siblings().removeClass('active');
      } else if (a[a.length - 1] < t) {
        $('.pc .menu > .on .depth2 li').eq(a.length - 1).addClass('active').siblings().removeClass('active');
        $('.mobile .menu > .active .depth2 li').eq(a.length - 1).addClass('active').siblings().removeClass('active');
      }
    }
  });
}

// 특징 아이콘 스크롤
function featureScroll() {
  var a = 60
  if ($(window).width() < 1000) {
    a = 30;
  }
  $('.ico-box-wrap li > a ').click(function() {
    var item = $(this).closest('li');
    var headerH = $('.header').height() + a;
    var index = item.index();
    var conTop = $('.pop-box-wrap > ul > li').eq(index).offset().top - headerH;
    item.addClass('active').siblings().removeClass('active');
    $('html, body').animate({
      scrollTop: conTop
    }, 500);
  });
}

// 체크박스 체크
function chkClick() {
  $('.icon-chk').click(function() {
    $(this).next('label').click();
  });
}
// 라디오박스 체크
function radioClick() {
  $('.icon-radio').click(function() {
    $(this).next('label').click();
  });
}

$(document).ready(function() {
  headerFix();
  language();
  gnbOpen();
  topAnchor();
  contactButton();
  subCategory();
})

// 파일첨부 input
function inputFile(button, input) {
  $(button).click(function() {
    $(input).click();
    $(input).change(function() {
      var valueSplit = this.value.split('\\');
      valueSplit = valueSplit.reverse();
      $(button).prev('.filename').text(valueSplit[0]);
    })
  });
}

// 아코디언 accordion
function accordionToggle(e) {
  $(e).parent('li').toggleClass('on');

}

//모바일 tab
function selectTab(idx) {
  console.log(idx);
  $('.tab-con .con').removeClass('on').eq(idx - 1).addClass('on');
}


//초기화 ㅂ ㅓ튼
function resetbtn() {
  alert("입력하신 정보가 초기화 됩니다. 취소 하시겠습니까?")
}

function pwbtn() {
  alert('비밀번호 설정이 완료 되었습니다.');
}

function delbtn() {
  alert('정말 체크된 배너들을 삭제하시겠습니까?');
}

$(document).ready(function() {
  $(".main99").click(function() {
    if ($(".sub99").is(":visible")) {
      $(".sub99").css("display", "block");
      $(".sub88").css("display", "none");
      // $(".main88").css("background-color", "gray");
      // $(".main88").css("color", "white");
      // $(".main99").css("background-color", "white");
      // $(".main99").css("color", "black");
    } else {
      $(".sub99").css("display", "block");
      $(".sub88").css("display", "none");
      $(".main99").css("background-color", "gray");
      $(".main99").css("color", "white");
      $(".main88").css("background-color", "white");
      $(".main88").css("color", "black");
    }
  });
});
$(document).ready(function() {
  $(".main88").click(function() {
    if ($(".sub88").is(":visible")) {
      $(".sub88").css("display", "block");
      $(".sub99").css("display", "none");
      // $(".main99").css("background-color", "gray");
      // $(".main99").css("color", "white");
      // $(".main88").css("background-color", "white");
      // $(".main88").css("color", "black");
    } else {
      $(".sub88").css("display", "block");
      $(".sub99").css("display", "none");
      $(".main88").css("background-color", "gray");
      $(".main88").css("color", "white");
      $(".main99").css("background-color", "white");
      $(".main99").css("color", "black");
    }
  });
});

//
$(document).ready(function() {
  // $("ul > li:first-child a").next().show();
  $(".main-list").click(function() {
    $(this).next().slideToggle(250);
    // $(this).next().slideDown(300);
    $(".main-list").not(this).next().slideUp(250);
    return false;
  });
  $(".main-list").eq(0).trigger("click");
});


//카테고리 js
//추가
$(document).ready(function() {
  $("#popup_open").click(function() {

    $("#popup_wrap").css("display", "block");
    $("#mask").css("display", "block");
  });
});
$(document).ready(function() {
  $("#popup_open").click(function() {

    $("#popup_wrap").css("display", "block");
    $("#mask").css("display", "block");
  });
  $("#popup_close").click(function() {
    $("#popup_wrap").css("display", "none");
    $("#mask").css("display", "none");
  });
});
//삭제
$(document).ready(function() {
  $("#delete").click(function() {

    $("#wrap").css("display", "block");
    $("#mask2").css("display", "block");
  });
});
$(document).ready(function() {
  $("#delete").click(function() {

    $("#wrap").css("display", "block");
    $("#mask2").css("display", "block");
  });
  $("#close").click(function() {
    $("#wrap").css("display", "none");
    $("#mask2").css("display", "none");
  });
});