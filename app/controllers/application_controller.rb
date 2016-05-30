class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # 在所有控制器中引入session模块辅助方法
  include SessionsHelper

	# 确保用户已登录
	def logged_in_user
		if !logged_in?
			store_location	        
			flash[:danger] = "请先登录！"
			redirect_to login_url
		end
	end


end
