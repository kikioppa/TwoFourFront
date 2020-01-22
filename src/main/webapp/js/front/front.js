var imgs = $("img"),$w = $(window),ing = setInterval(function(){
	var i = imgs.length,j=0;
	while(i--) {
		imgs[i].complete && ++j;
	}
	if (j == imgs.length) {
		clearInterval(ing);
	   
	} else {
	  
	}
}, 100);

$(document).ready(function(){

	//GNB
	$("#gnb > div > a").on("mouseenter",function(){
		$("#gnb > div").removeClass('hover');
		$(this).parent().addClass('hover');
	});

	$("header").on("mouseleave",function(){
		$("#gnb > div").not('.open').removeClass('hover');
		$(".open").addClass('hover');
	});

	//메인 커리큘럼
//	$(".curriculum > div").on("mouseenter",function(){
//		$(".curriculum .info").stop().animate({
//				bottom: -157
//		}, 'fast');
//		$(this).children('.curriculum .info').show().stop().animate({
//				bottom: 0
//		}, 'slow');
//	});

	//메인 소셜네트워크
	$(".socialBox > a").on("click",function(){
		$(".socialBox > a").removeClass('on');
		$(".socialBox .sliderWrap").removeClass('on');
		$(this).addClass('on');
		$(this).next().addClass('on');
	});

	//아카데미소개
	$(".partnership a").on("mouseenter",function(){
		$(".partnership p").removeClass('show');
		$(this).next().addClass('show');
	});

	//퀵메뉴 탑버튼
	$(".btnGoTop").on("click",function(){
		$('html').animate({
			scrollTop: 0
		}, 'slow');
	});

	//탭메뉴
	var $body = $('body');
	$body.on('click', '.ui_tab > li', function(e) {
		var targetTab = $(e.target).closest('.tabContainer');
		var activeTab = $(this).attr("data-tab");
		targetTab.find(".ui_tab > li").removeClass("on");
		targetTab.find(".tabcontent").removeClass("on");

		$(this).addClass("on");
		$("#" + activeTab).addClass("on");
		$("#" + activeTab).find(".tabcontent").eq(0).addClass("on");
		$("#" + activeTab).find(".ui_tab > li").eq(0).addClass("on");

		e.preventDefault();
	})

	//교육과정 FAQ
	$(".faq li > a").on("click",function(e){
		$(".faq li").removeClass("open");
		$(this).parent().addClass("open");
		e.preventDefault();
	});
	$(".faq div a").on("click",function(e){
		$(this).parent().parent().removeClass("open");
		e.preventDefault();
	});

	//스페셜과정
//	$(".class a").on("click",function(e){
//		$(".class").removeClass('open');
//		$(this).parent().siblings().addClass('open');
//		e.preventDefault();
//	});

	//쿠킹랩
	$(".cookingLab .class > div").on("mouseenter",function(){
		$('.cookingLab .class .info').removeClass('on');
		$(this).children('.info').addClass('on');
	});

	//갤러리
	$(".gridItem").on("mouseenter",function(){
		$(".gridItem").removeClass('hover');
		$(this).addClass('hover');
	});
	$(".gridItem").on("mouseleave",function(){
		$(".gridItem").removeClass('hover');
	});

	//갤러리
	$(".slide .thumb a").on("click",function(e){

		$(".slide .thumb li").removeClass('selected');
		$(this).parent().addClass('selected');
		
		$('.big').find('img').attr('src',$(this).next().val());

		e.preventDefault();
	});

	//정규과정 플로팅버튼
	$(window).scroll(function() {
		var winTop = $(this).scrollTop();
		var footerTop = $('footer').offset().top;
		var bottomPo = footerTop-winTop;
		if(bottomPo <= 900){
			$('.floatBtn').css({'bottom' : '300px'});
		}else if(winTop >= 300 && bottomPo > 900){
			$('.floatBtn').css({'bottom' : '50px'});
		}else if(winTop > 150 && winTop < 300){
			$('.floatBtn').css({'bottom' : '0'});
		}else{
			$('.floatBtn').css({'bottom' : '-200px'});
		}
	});

	//정규과정 이메일 신청
	$(".btnEmail").on("click",function(e){
		$(".floatBtn .pop").toggleClass('open');
		e.preventDefault();
	});

});

function openPopup(){
	$('.popup').css({
		'display':'table'
	});
}

function closePopup(){
	$('.popup').hide();
}

//진행중인 단기과정
function shortCourse(){
	$(".courseList li").not($(".courseList.end li")).on("mouseenter",function(){
		$(".courseList li").removeClass('hover');
		$(this).addClass('hover');
		$(".courseList li .title, .courseList li .desc").dotdotdot();
	});
	$(".courseList li").not($(".courseList.end li")).on("mouseleave",function(){
		$(".courseList li").removeClass('hover');
	});
}

//게시판내 공유하기 복사
$(function(){
	var clipboard = new Clipboard('#copyText');
	clipboard.on('success', function(e) {
		alert('URL이 복사되었습니다');
	});
});

window.fbAsyncInit = function() {
    FB.init({
      appId            : '978705988951862',
      autoLogAppEvents : true,
      xfbml            : true,
      version          : 'v2.11'
    });
    FB.AppEvents.logPageView();
}; 

(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.11&appId=136863220304706';
	  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function faceBookShare(linkUrl) {
	 FB.ui({
	   method: 'share',
	   mobile_iframe: true,
	   href: linkUrl,
	 }, function(response){});
}
