require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test 'index' do 
  	get 'index'
  	assert_template 'home/index'
  	assert_select 'title', 'Web学习网'
  end
end
