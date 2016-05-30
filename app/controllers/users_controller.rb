class UsersController < ApplicationController
	# 授权
	before_action :logged_in_user, only: [:edit, :update]
	before_action :correct_user, only: [:edit, :update]
	def new
		@user = User.new
	end

	def create
		@user = User.new

		# 密码不一致返回
		if params[:user][:password] != params[:user][:password_confirmation]
			flash.now[:danger] = '两次密码不一致，请重新设置密码'
			render 'new' and return
		end

		if User.exists?(username: params[:user][:username])
			flash.now[:danger] = '用户名已存在'
			render 'new' and return
		end			

		if User.exists?(email: params[:user][:email])
			flash.now[:danger] = '邮箱账号已存在'
			render 'new' and return
		end			

		@user = User.new(user_params)

		# 结果
		if !@user.save
			flash.now[:danger] = '注册失败，请根据要求填写'
			render 'new' and return
		else
			log_in @user
			flash[:success] = "注册成功。#{@user.username}，欢迎来到Web学习网"
			redirect_to @user and return
		end
	end

	def edit
		# @user = User.find(params[:id]) beform_action中解决
	end

	def update
		# @user = User.find(params[:id]) beform_action中解决

		# 修改密码
		if params[:revise] == 'password'
			# 密码不一致返回
			if params[:user][:password] != params[:user][:password_confirmation]
				flash.now[:danger] = '资料更新失败! 两次密码不一致，请重新设置密码'
				render 'edit' and return
			end

			if !@user.authenticate(params[:user][:password_old])
				flash.now[:danger] = '资料更新失败! 原密码验证失败，请重新输入'
				render 'edit' and return
			end				

			if !@user.update(user_password_params)
				flash.now[:danger] = '资料更新失败! 请按要求操作'
				render 'edit' and return
			else
				flash[:success] = "用户#{@user.username}密码修改成功"
				redirect_to @user and return
			end

		# 修改资料
		else
			username = params[:user][:username]
			email = params[:user][:email]
			if username != @user.username
				if User.exists?(username: username)
					flash.now[:danger] = '资料更新失败! 用户名已存在'
					render 'edit' and return
				end
			end

			if email != @user.email
				if User.exists?(email: email)
					flash.now[:danger] = '资料更新失败! 邮箱已存在'
					render 'edit' and return
				end
			end

			if !@user.update(user_info_params)
				flash.now[:danger] = '资料更新失败! 请按要求操作'
				render 'edit' and return
			else
				flash[:success] = "用户#{@user.username}资料更新成功"
				redirect_to @user and return
			end
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private
		# 确保用户正确
	    def correct_user
	      @user = User.find(params[:id])
	      redirect_to(root_url) if !current_user?(@user)
	    end

		# 确保用户已登录
	    def logged_in_user
	      if !logged_in?
			store_location	        
			flash[:danger] = "请先登录！"
	        redirect_to login_url
	      end
	    end

		# 传参处理
		def user_params
			params.require(:user).permit(:username, :password, :email, :score, :sign, :thumb)
		end

		def user_info_params
			params.require(:user).permit(:username, :email, :sign, :thumb)
		end

		def user_password_params
			params.require(:user).permit(:password)
		end
end
