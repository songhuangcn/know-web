require 'test_helper'

class StudyControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
