require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	# 初始化测试数据
	def setup
		@user = users(:pinewong)
	end


	# 失败闪现提示
	test "login with invalid information" do
		get login_path
		assert_template 'sessions/new'
		post login_path, session: { username: "", password: "" }
		assert_template 'sessions/new'
		assert_not flash.empty?
		get root_path
		assert flash.empty?
	end

	test "login with valid information" do
		get login_path
		post login_path, session: { username: @user.username, password: 'password' }
		assert_redirected_to user_path(@user)
		follow_redirect!
		assert_select "a[href=?]", login_path, count: 0
		assert_select "a[href=?]", logout_path
		assert_select "a[href=?]", user_path(@user)

		delete logout_path
	    assert_not is_logged_in?
	    assert_redirected_to root_url
	    follow_redirect!
	    assert_select "a[href=?]", login_path
	    assert_select "a[href=?]", signup_path
	    assert_select "a[href=?]", logout_path,      count: 0
	    assert_select "a[href=?]", user_path(@user), count: 0
	end
end
