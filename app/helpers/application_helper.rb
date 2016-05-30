module ApplicationHelper
	# 设置标题，加基本标题
	def title(title = '')
		baseTitle = 'Web学习网'
		return title.empty? ? baseTitle : "#{title} | #{baseTitle}"
	end

	def gravatar_for(user)
	    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	    gravatar_url = "http://cn.gravatar.com/avatar/#{gravatar_id}"
	    link_to image_tag(gravatar_url, alt: user.username, class: "gravatar"), 'http://cn.gravatar.com/';
  	end
end
