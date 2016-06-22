class CommentsController < ApplicationController
	# 授权
	before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]

	def create
		@topic = Topic.find(params[:topic_id])
    	@comment = @topic.comments.build(comment_params)

		if !@comment.save(comment_params)
			flash[:danger] = "评论失败！请按要求操作，字数不少于6"
			redirect_to @topic
		else
			flash[:success] = "评论话题“ #{@topic.title} ”成功，积分+ #{score(:comment)}"
			# 增加用户积分
      		current_user.update(score: current_user.score+score(:comment))
      		@topic.update(reply_count: @topic.comments.count)
			redirect_to @topic
		end
	end

	def destroy
		# beform_action中解决
		# @topic = Topic.find(params[:topic_id])
		# @comment = @topic.comments.find(params[:id])

		if !@comment.update_attribute(:deleted, true)
			flash[:danger] = "删除评论失败！请按要求操作"
			redirect_to @topic
		else
			flash[:success] = "删除评论成功"
			redirect_to @topic
		end

	end

	private
		# 确保用户正确
	    def correct_user
			@topic = Topic.find(params[:topic_id])
			@comment = @topic.comments.find(params[:id])
			user = @comment.user

	      if !current_user?(user)
			flash[:danger] = "禁止操作，不能操作其他用户话题"
	      	redirect_to(root_url) 
	      end
	    end

		def comment_params
			params.require(:comment).permit(:content, :user_id)
		end
end
