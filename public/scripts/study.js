/**
 * 
 * @authors Pine Wong (pinewong@163.com)
 * @date    2016-05-13 22:19:53
 * @version $Id$
 */

$(function() {
	// download-icon图标变化
	downloadIconChange();

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