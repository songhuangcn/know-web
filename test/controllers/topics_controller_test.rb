require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  def setup
  	@user = users(:pinewong)
    @topic = topics(:orange)
  end


  test "should redirect create when not logged in" do
    assert_no_difference 'Topic.count' do
      post :create, topic: { title: 'aaaaaaaaaaa', content: "Loreaaaam ipsum", user_id: '1' }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Topic.count' do
      delete :destroy, id: @topic
    end
    assert_redirected_to login_url
  end
end
