require 'test_helper'

class SiteLayoutsTest < ActionDispatch::IntegrationTest
  test 'layouts links' do
  	get root_path
  	assert_template 'home/index'
  	assert_select 'a[href=?]', root_path
  	assert_select 'a[href=?]', study_path
  	assert_select 'a[href=?]', download_path
  	assert_select 'a[href=?]', topics_path
  end


end
