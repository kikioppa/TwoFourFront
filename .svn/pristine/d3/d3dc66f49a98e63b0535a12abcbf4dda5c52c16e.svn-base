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

function menubInit(){
	$('#gnb > div .depth2').not('.open .depth2').hide();
}

$(document).ready(function(){

	//GNB
	menubInit();
	// banner
	showTopBanner();

	$(".btnMenu").on("click",function(){
		menubInit();
		$('header').toggleClass('fixed');
		$('#gnb').toggle();
	});

	$("#gnb > div > a").on("click",function(){
		 menubInit();
		 
		 if($(this).parent().hasClass('hover')){
			 if($(".hover").length > 0){
				 $(this).parent().removeClass('hover');
				 $(this).parent().removeClass('open');
				 $(this).next().hide(); 
			 }
		 }else{
			 if($(".hover").length > 0){
				$('#gnb > div .depth2').hide();
				$('#gnb > div').removeClass('hover');
				$('#gnb > div').removeClass('open');
			 }
			 $(this).parent().addClass('hover');
			 $(this).parent().addClass('open');
			 $(this).next().show();
		 }
		
		
	});

	//메인 소셜네트워크
	$(".socialBox > a").on("click",function(e){
		$(".socialBox .sliderWrap").removeClass('on');
		$(this).next().addClass('on');
		$(".socialBox > a").find("img").each(function(){
			$(this).attr("src",$(this).attr("src").replace("on.png","off.png"));
		});
		$(this).children("img").attr("src",$(this).children("img").attr("src").replace("off.png","on.png"));
		e.preventDefault();
	});

	$('.bannerPop .closeBtn').on('click',function(){
		//setCookie('mainTopBan_m', true, 1);
		$('.bannerPop').remove();
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
		//$("#" + activeTab).find('select').find('option:first').attr('selected', 'selected');
		e.preventDefault();
	})

	$(".tabContainer select").on("change",function(e){
		var selected = $(this).val()
		$("#" + selected).siblings().removeClass("on");
		$("#" + selected).addClass("on");
	});

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

	//페이지이동
	$("#goPage").on("change",function(e){
		window.location.href=this.value;
	});

	//진행중인 단기과정
	$(".courseList li").not($(".courseList.end li")).on("mouseenter",function(){
		$(".courseList li").removeClass('hover');
		$(this).addClass('hover');
		$(".courseList li .title, .courseList li .desc").dotdotdot();
	});

	//스페셜과정
//	$(".class a").on("click",function(e){
//		$(".class").removeClass('open');
//		$(this).parent().siblings().addClass('open');
//		e.preventDefault();
//	});

	//갤러리
	$(".slide .thumb a").on("click",function(e){

		$(".slide .thumb li").removeClass('selected');
		$(this).parent().addClass('selected');

		$('.big').find('img').attr('src',$(this).next().val());

		e.preventDefault();
	});

	//찾아오시는 길
	$(".directionsInfo a").on("click",function(e){

//		$(".directionsInfo a").removeClass('open');
//		$(".directionsList").hide();
		if($(this).hasClass('open')){
			$(".directionsInfo a").removeClass('open');
			$(".directionsList").hide();
		}else{
			if($(".open").length > 0){
				$(".directionsInfo a").removeClass('open');
				$(".directionsList").hide();
			}
			$(this).addClass('open');
			$(this).next().show();
		}
		
		e.preventDefault();
	});

	//뒤로가기
	$(".btnBack").on("click", function(e){
		 window.history.back();
	});
});

function openPopup(){
	$('.popup').show();
}

function closePopup(){
	$('.popup').hide();
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
//	   mobile_iframe: true,
	   href: linkUrl,
	 }, function(response){});
}

function showTopBanner(){
	var state = getCookie('mainTopBan_m');
	if (state) {
		$('.bannerPop').remove();
	}
}

function setCookie(name, value, expiredays) {
	var todayDate;
	todayDate = new Date;
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + '=' + escape(value) + '; path=/; expires=' + todayDate.toGMTString() + ';';
}

function getCookie(cookieName) {
	var i, thisCookie;
	thisCookie = document.cookie.toString().split('; ');
	i = 0;
	while (i < thisCookie.length) {
		if (cookieName === thisCookie[i].split('=')[0]) {
			return thisCookie[i].split('=')[1];
		}
		i++;
	}
}
