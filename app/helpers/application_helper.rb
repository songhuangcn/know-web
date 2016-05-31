module ApplicationHelper
	# 设置标题，加基本标题
	def title(title = '')
		baseTitle = 'Web学习网'
		return title.empty? ? baseTitle : "#{title} | #{baseTitle}"
	end

	def gravatar_for(user)
		email = (user.nil? || user.email.nil?) ? 'user@example.com' : user.email
	    gravatar_id = Digest::MD5::hexdigest(email.downcase)
	    gravatar_url = "http://cn.gravatar.com/avatar/#{gravatar_id}"

      username = (user.nil? || user.username.nil?) ? 'User' : user.username
	    link_to image_tag(gravatar_url, alt: username, class: "gravatar"), 'http://cn.gravatar.com/';
  	end

  	# 根据action值添加css的selected属性
  	def selected_by_action(name, base)
		params[:action] == name ? "#{base} selected" : base
  	end

  	# 话题是否精华
  	def essence?(topic)
  		topic.like_count >= 5
  	end

  	# 加分方案
  	def score(action = :login)
  		case action
  		when :login then
  			5
  		when :topic then
  			20
  		when :like then
  			10
  		when :comment then
  			10
  		end
  	end
end
