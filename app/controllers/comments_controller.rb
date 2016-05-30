class CommentsController < ApplicationController
	def create
		@topic = Topic.find(params[:topic_id])
		if @topic.comments.create(comment_params)
			redirect_to @topic
		else
			render 'topics/show'
		end
	end

	def destroy
		@topic = Topic.find(params[:topic_id])
		@comment = @topic.comments.find(params[:id])
		@comment.update_attribute(:content, '内容已被删除！')
		redirect_to @topic
	end

	private
		def comment_params
			params.require(:comment).permit(:content)
		end
end
