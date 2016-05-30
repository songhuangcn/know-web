class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && !!user.authenticate(params[:session][:password])
    	log_in user
    	redirect_back_or user and return
    else
      flash.now[:danger] = '登陆失败，账户名或密码错误'
      render 'new' and return
    end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end
end
