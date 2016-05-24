/**
 * 
 * @authors Pine Wong (pinewong@163.com)
 * @date    2016-03-28 22:25:26
 * @version $Id$
 */

$(function() {
 	// 返回顶部，参数为距顶部位置
 	toTop(100);

 	// 快速登录pic变化
 	loginPic();

	// download-icon图标变化
	downloadIconChange();

	// 更换下载内容
	changeDownloadCategory();

	// 轮播
	slide();

	// 项目演示动画
	changeDemo();
});

function toTop(distanceFromTop) {
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

// download.hs
// download-icon图标变化
function downloadIconChange() {
	var arr = $('#downloads-content .windows');
	$.each(arr, function() {
		$(this).mouseover(function(key, value) {
		alert($(this));
			alert($(this) + ': '+key + ': '+value);
		});	
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

// home.js
function slide() {
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
	var slide = setInterval(slideAuto, 5000);

	// 鼠标经过停止轮播
	$('#banner').mouseover(function() {
		clearInterval(slide);
		// $('#banner').animate({ opacity: 0.8 });
	});
	// 鼠标离开开始轮播
	$('#banner').mouseout(function() {
		slide = setInterval(slideAuto, 5000);
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

function alertMessage(message) {
	alert(message);
}