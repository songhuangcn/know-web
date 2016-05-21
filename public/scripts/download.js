/**
 * 
 * @authors Pine Wong (pinewong@163.com)
 * @date    2016-05-13 22:19:53
 * @version $Id$
 */

$(function() {
	// download-icon图标变化
	downloadIconChange();

	// 更换下载内容
	changeDownloadCategory();
});




// download-icon图标变化
function downloadIconChange() {
	$('.download-icon').each(function(key, value) {
		var src = value.src;
		// alert(src);
		src = src.replace('.png', '-hover.png');
		// alert(src);
		
		//changeSrc(value, src, 1000);

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