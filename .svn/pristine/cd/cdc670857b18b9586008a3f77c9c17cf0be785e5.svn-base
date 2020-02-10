$(document).ready(function() {

  //pulldown 메뉴
  mainInterface();
  
  
  navScrollEvent();
  
//  tabPaging();
//  
  sectionMinHeight();
});
// main scroll event
function navScrollEvent(){
  // var now = 0;
  var last = 0;
  var nav = $('nav');
  var container = $('.container');
  var gap = 25;
  if( !$('nav').hasClass('sub') ){

    window.addEventListener('scroll',function(e){
      // console.log('now:'+window.scrollY+', last:'+last);
      if( window.scrollY - last > gap ){
        //스크롤 다운
        nav.addClass('slide-up');
        container.removeClass('wedge');
      } else if ( window.scrollY - last <= -gap || window.scrollY === 0 ) {
        //스크롤 업
        nav.removeClass('slide-up');
        container.addClass('wedge');
      }
      this.setTimeout(function(){
        last = window.scrollY;
      }, 700);
    });
  }
}

// pulldown-menu 2depth toggle
function slideDownChild(clicked){
  // console.log($(clicked).parents('li'));
  $(clicked).parents('li').toggleClass('toggle-on').next().slideToggle();
  $('.has-child > a').not(clicked).parents('li').toggleClass('toggle-on').next().slideUp();
}

function mainInterface() {
  // 포지션 기억
  var pos = 0;

  function rememberPosition() {
    pos = window.pageYOffset;
  }

  $('.accordion-list a').click(function(e){
    e.preventDefault();
  })
  

  //pulldown-menu init
  $('.pulldown-menu .accordion-list .child').slideUp();

  // 전체메뉴 열기
  $('.hamberger-menu').click(function(e) {
    e.preventDefault();
    rememberPosition();
    $('.main').css('position', 'fixed').css('left', '0').css('right', '0');
    $('.pulldown-menu').removeClass('slide-up');
  });

  // 전체메뉴 닫기
  $('.pulldown-menu .suffix .btn-close').click(function(e) {
    console.log('close', pos);
    e.preventDefault();
    $('.main').css('position', 'relative');
    window.scrollTo(0, pos);
    $('.pulldown-menu').addClass('slide-up');
  })
}

// 컨텐츠 내용이 짧을경우 페이지 높이조정
function sectionMinHeight(){
  var gap = 200;
  var minHeight = window.outerHeight - $('nav').height() - $('.bottom-menu-bar').height() - gap;
  if( $('.container > section').length < 2 ){
    if( $('.container > section').hasClass('tab-paging') ){
//      console.log('탭 페이징');
      $('.tab-content > ul > li').each(function(){
        if( $(this).has('section').length < 2 ){
          $(this).children('section').css('min-height', minHeight);
        }
      })
    } else {

      // alert('페이지사이즈 조정, '+minHeight);
      $('.container > section').css('min-height', minHeight);
    }

  }
  
}

function tabPaging(){
  var tabIndex = 0;
  //default
  $('.tab-paging .tab-index > ul > li').eq(tabIndex).addClass('on');
  $('.tab-content > ul > li').eq(tabIndex).show().siblings().hide();

  $('.tab-paging .tab-index > ul > li > a').click(function(e){
    e.preventDefault();

    
    //tab-index 작동
    $(this).parents('li').addClass('on').siblings().removeClass('on');

    // 현재 tabindex 저장
    tabIndex = $('.tab-paging .tab-index > ul > li').index($(this).parents('li'));

    console.log(tabIndex);

    //tab-content 작동
    $('.tab-content > ul > li').eq(tabIndex).show().siblings().hide();

  })
}

//FAQ 검색어 태그 버튼
function quickTag(){
  $('.quick-tag a').click(function(e){
    e.preventDefault();
    $(this).parents('li').addClass('on').siblings().removeClass('on')
    console.log($(this));
  })  
}

function modalOpen(target){
  $(target).show();
  modalClose();
}

function modalClose(){
  $('.modal-pop .btn-close').click(function(){
    $('.modal-pop').hide();
  })
}