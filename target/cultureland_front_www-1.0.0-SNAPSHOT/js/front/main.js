var 
mainSlider,
mainModule = {
	setfullpage : function(){
		$('#fullpage').fullpage({
			anchors: ['#section1', '#section2', '#section3'],
			lockAnchors: true,
			verticalCentered: false,
			responsiveHeight:850,
			responsiveWidth:1080,
			scrollOverflow: true
		});
	},
	setMainSliderHeight : function(el){
		var wH = mainModule.getHeight(window);
		var navH = $('.topWrap').height() + $('.bannerPop').height();
		$('.mainSlider .sliderIn').css('height',(wH-navH)+'px');
	},
	setMainSlider : function(){
		mainModule.setMainSliderHeight();
		mainSlider = $('.mainSlider').bxSlider({
			auto: true,
			mode:'fade',
			controls: true,
			autoControls: true,
			autoControlsCombine: true,
			pause:5000
		});
	},
	getHeight : function(el){
		return $(el).height();
	},
	closeTop : function(){
		if( mainModule.getChecking() ){
			setCookie('mainTopBan', true, 1);
		}
		$('.bannerPop').remove();
		$('.quick, #fullpage').addClass('bannerClosed');
		$.fn.fullpage.reBuild();
		$('#section3').css('padding-top',0);
		mainModule.setMainSliderHeight();
		mainSlider.reloadSlider();
	},
	getChecking : function(){
		return $('#todayC').prop('checked');
	},
	showTop : function(){
		var state = getCookie('mainTopBan');
		console.log(state);
		if (state) {
			$('.bannerPop').remove();
			$('.quick, #fullpage').addClass('bannerClosed');
			$('.section').css('padding-top','100px');
			$.fn.fullpage.reBuild();
			mainModule.setMainSliderHeight();
			$('#section3').css('padding-top',0).find('.dummy').css('height','100px');
		}
	}
}



$(window).resize(function() {
	//$.fn.fullpage.reBuild();
	
	// 화면 리사이징할때 슬라이더 높이를 재조정한다.
	mainModule.setMainSliderHeight();
});

window.onload = function() {
	var 
	imgs = $("img"),
	$w = $(window),
	ing = setInterval(function(){
		var i = imgs.length,j=0;
		while(i--) {
			imgs[i].complete && ++j;
		}
		if (j == imgs.length) {
			clearInterval(ing);
		} else {}
	}, 100);


	

	$('.courseSlider').bxSlider({
		pager:false,
		auto: true,
		stopAutoOnClick: true
	});

	// 탑 배너 노출여부 결정
	mainModule.showTop();

	// 탑 배더 닫기 이벤트 바인딩
	$('.btnClose').on('click',function(){
		mainModule.closeTop();
	});
	
	$('.btnGoTopMain').on('click',function(){
		$.fn.fullpage.moveTo(1);
	});
	
//	/*$('.bannerSlider').bxSlider({
//		pager:false,
//		auto: true
//	});*/

	$('.gallerySlider').bxSlider({
		controls:false,
		slideWidth:535,
		auto: true,
		autoControls: true,
		autoControlsCombine: true,
		pause:5000
	});

	$('.socialBox .slider').bxSlider({
		pager:false,
		slideWidth:88,
		maxSlides:3,
		minSlides:3,
		slideMargin:30
	});

	$('.partnersSlider').bxSlider({
		controls:false,
		slideMargin:0,
		slideSelector:'.partners'
	});

	// $('.academySlider').bxSlider({
	// 	pager:false,
	// 	slideWidth:175,
	// 	maxSlides:6,
	// 	minSlides:6,
	// 	slideMargin:6,
	// 	moveSlides:1,
	// 	touchEnabled:false
	// });
	$('.regcurrSlider').bxSlider({
		maxSlides:3,
		minSlides: 3,
		slideMargin: 10,
		moveSlides: 1,
		// infiniteLoop: false,
		slideWidth: 220,
		controls: false,
		auto: true,
		// autoControls: true,
		autoControlsCombine: true,
		pause:3000
	});
	$('.galleryRe .img-wrap').bxSlider({
		pager: true,
		controls: false,
		maxSlides:1,
		moveSlides:1
	});

	
}
$(document).ready(function() {

	// 풀페이지 로드
	// mainModule.setfullpage();

	// mainModule.setMainSliderHeight();

	// mainModule.setMainSlider(this);
	
	// 메인 큰 배너 탭
	bigsquareTab();

	// 레이어팝업
	laypopClose();
	
});

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

function bigsquareTab(){
	$('.tabs li').click(function(e){
		
		var idx = $('.tabs li').index( $(this) );

		// 하단 배너 offset
		var boffset = $('.baneerBtm').offset().top;

		// 링크
		var desti = [
			'https://www.spcculinary.co.kr/board/view.do?seq=208&rownum=54',
			'https://www.spcculinary.co.kr/etcCourse/shortCourse.do?progYn=Y',
			'javascript:void(0)',
			'https://www.spcculinary.co.kr/etcCourse/cookingLab.do'
		]

		// 이미지
		var imgsrc = [
			'../images/main/bigsq_img01.jpg',
			'../images/main/bigsq_img02.jpg',
			'../images/main/bigsq_img03.jpg',
			'../images/main/bigsq_img04.jpg'
		]

		// alt값
		var imgalt = [
			'2019 상반기 입학설명회',
			'단기과정:프랑스식 제빵 비에누아즈리의 모든것',
			'2019 상반기 정규과정 모집',
			'원데이 클래스'
		]

		$(this).addClass('on').siblings('li').removeClass('on');
		$('.bigBanner-wrap img').attr('src', imgsrc[idx] );
		$('.bigBanner-wrap img').attr('alt', imgalt[idx] );
		$('.bigBanner-wrap a').attr('href', desti[idx] );
		if( idx == 2 ){
			// 3번째 탭은 아래 배너로 스크롤
			// e.preventDefault();

			// setTimeout(function(){
			// 	$('body,html').animate({
			// 	  scrollTop: boffset
			// 	}, 1000 );
			// }, 500);

			$('.bigBanner-wrap a').on('click',function(){
				$('body,html').animate({
				  scrollTop: boffset
				}, 1000 );
			})

		} else {
			$('.bigBanner-wrap a').off('click');
		}
	});
}

function laypopClose(){
	$('.layer-pop-wrap .close').click(function(e){
		$('html').css('overflow','auto');
		e.preventDefault();
		$('.layer-pop-wrap').removeClass('on');
	});

}
function openPop(i){
	$('html').css('overflow','hidden');
	var idx = i;
	var pops = $('.layer-pop-wrap');
	$( pops[idx] ).addClass('on');
}