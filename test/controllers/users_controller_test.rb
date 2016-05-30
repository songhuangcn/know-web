require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	def setup
		@user = users(:pinewong)
		@other_user = users(:user)
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should redirect edit when if logged in" do
		get :edit, id: @user
		assert_redirected_to login_url
		log_in_as(@user)
		get :edit, id: @user
		assert_template 'edit'
	end

	test "should redirect update when if logged in" do
		patch :update, id: @user, user: { username: @user.username, email: @user.email }
		assert_redirected_to login_url
		log_in_as(@user)
		patch :update, id: @user, user: { username: @user.username, email: @user.email }
		assert_redirected_to @user
	end

	# 用户不能修改非自身资料
	test "should redirect edit when logged in as wrong user" do
		log_in_as(@other_user)
		assert is_logged_in?
		get :edit, id: @user
		assert_redirected_to root_url
	end

	# 用户不能更新非自身资料
	test "should redirect update when logged in as wrong user" do
		log_in_as(@other_user)
		patch :update, id: @user, user: { username: @user.username, email: @user.email }
		assert_redirected_to root_url
	end
end
