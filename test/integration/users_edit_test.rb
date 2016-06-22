require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:pinewong)
	end

	test "unsuccessful edit" do
		# log_in_as(@user)
		# get edit_user_path(@user)
		# .
		# .
		# .
	end

	test "successful edit" do
		#
	end

	test "successful edit with friendly forwarding" do
		get edit_user_path(@user)
		assert_redirected_to login_path
		log_in_as(@user)
  		# assert_select 'a[href=?]', root_path
		assert_redirected_to edit_user_path(@user)
		


		username  = "FooBar"
		email = "foo@bar.com"
		patch user_path(@user), user: { username:  username,
		                                email: email
		                            }
		assert_not flash.empty?
		assert_redirected_to @user
		@user.reload
		assert_equal @user.username,  username
		assert_equal @user.email, email
	end

end
