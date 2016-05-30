require 'test_helper'

class StudyControllerTest < ActionController::TestCase
  test 'index' do 
  	get 'index'
  	assert_template 'study/index'
  	assert_select 'title', '在线学习 | Web学习网'
  end
end
