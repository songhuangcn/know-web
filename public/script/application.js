function toTop(distanceFromTop = 200) {
	// 滚动超出一定范围，图标出现
	$(window).scroll(function() {  
		if ($(window).scrollTop() > distanceFromTop) {  
			$("#backtop").fadeIn(500);
		} else {  
			$("#backtop").fadeOut(500);  
		}  
	});  

    //点击触发返回顶部
    $("#backtop").click(function() {  
    	$('body, html').animate({ scrollTop: 0 }, 300);  
    	return false; 
    });  
  }

  function changeSrc(item, src, time) {
	// alert(item);
	item.mouseover(function() {
		item.animate({ 'src': src }, time);
	});
	
}

function loginPic() {
	$('#login-qq').mouseover(function() {
		$('#login-qq').attr('src', '/images/login-qq-2.png');
	});
	$('#login-weichat').mouseover(function() {
		$('#login-weichat').attr('src', '/images/login-weichat-2.png');
	});
	$('#login-github').mouseover(function() {
		$('#login-github').attr('src', '/images/login-github-2.png');
	});

	$('#login-qq').mouseout(function() {
		$('#login-qq').attr('src', '/images/login-qq-1.png');
	});
	$('#login-weichat').mouseout(function() {
		$('#login-weichat').attr('src', '/images/login-weichat-1.png');
	});
	$('#login-github').mouseout(function() {
		$('#login-github').attr('src', '/images/login-github-1.png');
	});
}

function changeDownloadCategory() {
	$('#downloads_content select').change(function() {
		var selectCategory = $('#downloads_content select').val();
		// alert(selectCategory);
		if (selectCategory == 'ides') {
			$('#down-ides').fadeIn();
			$('#down-tools').fadeOut();
			$('#down-editors').fadeOut();
		} else if (selectCategory == 'tools') {
			$('#down-ides').fadeOut();
			$('#down-tools').fadeIn();
			$('#down-editors').fadeOut();
		}  else if (selectCategory == 'editors'){
			$('#down-ides').fadeOut();
			$('#down-tools').fadeOut();
			$('#down-editors').fadeIn();
		}
	});

	$('#banner').mouseover(function() {
		clearInterval(slide);
		$('#banner').animate({ opacity: 0.8 });
	});
}

function leaveStop() {
	$("body").blur(function(){
		clearInterval(interval);
	});
}

function slide(interval, time = 5000) {
	var moveBase = -1366;	// 图片宽度
	var moveNo = 0;			// 移动量
	var bannerCount = 3;	// 总量

	function slideAuto() {
		if (++moveNo > bannerCount) {
			moveNo = 0;
		}
		var movePx = moveBase * moveNo + 'px';
		$('#banner .pic').animate({left: movePx});
	}
	// 自动轮播
	interval = setInterval(slideAuto, time);

	// 鼠标经过停止轮播
	$('#banner').mouseover(function() {
		clearInterval(interval);
		// $('#banner').animate({ opacity: 0.8 });
	});
	// 鼠标离开开始轮播
	$('#banner').mouseout(function() {
		interval = setInterval(slideAuto, time);
		// $('#banner').animate({ opacity: 1 });
	});


	// 前一张图片
	var flexPrev = $('#banner .flex_prev');
	flexPrev.click(function() {
		if (--moveNo < 0) {
			moveNo = 3;
		}
		var movePx = moveBase * moveNo + 'px';
		$('#banner .pic').animate({left: movePx});
	});

	// 后一张图片
	var flexNext = $('#banner .flex_next');
	flexNext.click(function() {
		if (++moveNo > bannerCount) {
			moveNo = 0;
		}
		var movePx = moveBase * moveNo + 'px';
		$('#banner .pic').animate({left: movePx});
	});
}

function changeDemo() {
	$('#project .demo li').mouseover(function() {
		$(this).animate({ opacity: 0.8 });
	});
	$('#project .demo li').mouseout(function() {
		$(this).animate({ opacity: 1 });
	});
}