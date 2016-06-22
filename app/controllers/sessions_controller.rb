class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && !!user.authenticate(params[:session][:password])
    	log_in user
      current_user.update(score: current_user.score+score(:login))
      flash[:success] = "登陆成功，积分+ #{score(:login)}"
   	  redirect_back_or user and return
    else
      flash.now[:danger] = '登陆失败，账户名或密码错误'
      render 'new' and return
    end
  end

  def destroy
  	log_out
    flash[:success] = "注销成功，每次登陆会增加 #{score(:login)} 积分，记得每天登陆哦"
  	redirect_to :back
  end
end
