module SessionsHelper
	# 登陆
	def log_in(user)
		session[:user_id] = user.id
	end

	# 取出当前用户，未登录返回nil
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])  # 使用find_by使得参数不存在时执行不会产生异常
	end

	# 当前用户判断
	def current_user?(user)
		user == current_user
	end

	# 如果用户已登录，返回 true，否则返回 false
	def logged_in?
		!current_user.nil?
	end	

	# 注销
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	# 重定向到存储的地址，或者默认地址
	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end

	# 存储以后需要获取的地址
	def store_location
		session[:forwarding_url] = request.url if request.get?
	end
end