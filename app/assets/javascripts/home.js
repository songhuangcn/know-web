/**
 * 
 * @authors Pine Wong (pinewong@163.com)
 * @date    2016-03-26 09:13:45
 * @version $Id$
 */

$(function() {
	// 轮播
	var interval;
	slide(interval, 1000);

	// 项目演示动画
	changeDemo();

	// 离开页面停止计时器
	leaveStop()
});

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