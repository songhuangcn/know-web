require 'test_helper'

class DownloadControllerTest < ActionController::TestCase
	test 'index' do
		get 'index'
		assert_template 'download/index'
		assert_select 'title', '工具下载 | Web学习网'
	end
end
