/**
 * 
 * @authors Pine Wong (pinewong@163.com)
 * @date    2016-03-28 22:25:26
 * @version $Id$
 */


$(function() {
	toTop(200);
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
