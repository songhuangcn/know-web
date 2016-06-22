ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def is_logged_in?
  	!session[:user_id].nil?
  end


	# 登入测试用户
	def log_in_as(user, options = {})
		password    = options[:password]    || 'password'
		# remember_me = options[:remember_me] || '1'
		if integration_test?
			post login_path, session: { 
				username: user.username,
				password: password
				# remember_me: remember_me 
			} 
		else
			session[:user_id] = user.id
		end
	end

	private
	    # 在集成测试中返回 true
	    def integration_test?
	    	defined?(post_via_redirect)
	    end  # Add more helper methods to be used by all tests here...
end
