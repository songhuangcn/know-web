require 'test_helper'

class TopicTest < ActiveSupport::TestCase
	def setup
		@user = users(:pinewong)
	    # 这行代码不符合常见做法
	    @topic = @user.topics.build(title: 'aaaaaaaaa', content: "Topic Content", user_id: @user.id)
	end

	test "should be valid" do
		assert @topic.valid?
	end

	test "user id should be present" do
		@topic.user_id = nil
		assert_not @topic.valid?
	end

	test "title should be present" do
		@topic.title = "   "
		assert_not @topic.valid?
	end

	test "content should be present" do
		@topic.content = "   "
		assert_not @topic.valid?
	end

	test "content should be at most 140 characters" do
		@topic.content = "a" * 1001
		assert_not @topic.valid?
	end

	test "order should be most recent first" do
		assert_equal Topic.first, topics(:most_recent)
	end

	# 用户、话题关联删除
	test "associated topic should be destroyed" do
		@user.save
		@topic.save
		assert_difference 'Topic.count', -1 do
			@user.destroy
		end
	end
end
