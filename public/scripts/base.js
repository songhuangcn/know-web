/**
 * 
 * @authors Pine Wong (pinewong@163.com)
 * @date    2016-03-28 22:25:26
 * @version $Id$
 */

$(function() {
 	// 返回顶部，参数为距顶部位置
 	toTop(100);

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