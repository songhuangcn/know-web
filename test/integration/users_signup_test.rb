require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	# 初始化数据
	def setup
		@user = users(:pinewong)
	end


	# 不合理数据
	test "invalid signup information" do
	    get signup_path
	    assert_no_difference 'User.count' do
	      post users_path, user: { username:  @user.username,
	                               email: @user.email,
	                               password:              'password',
	                               password_confirmation: 'password' }
	    end
	    assert_template 'users/new'
	end

	# 合理数据
	test "valid signup information" do
	    get signup_path
	    username = 'pinewonga'
	    email = 'pinewong@163s.com'
	    password = 'pinewong'

	    assert_difference 'User.count' do
	      	post_via_redirect users_path, user: { username:  username,
	                               password:   password,
	                               password_confirmation: password }
	    end
	    assert_template 'users/edit'
	    assert is_logged_in?
	end
end
