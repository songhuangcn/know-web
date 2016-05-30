class TopicsController < ApplicationController
	def index
		@topics = Topic.all
	end

	# 新建文章
	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(topic_params)

		if @topic.save
			redirect_to @topic
		else
			flash.now[:alert] = "Your book was not found"
			render 'new'
		end
	end
 
 	# 编辑文章
	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])
		if @topic.update(topic_params)
			redirect_to @topic
		else
			render 'edit'
		end
	end

	# 显示文章
	def show
		@topic = Topic.find(params[:id])
	end

	private
		def topic_params
	    	params.require(:topic).permit(:title, :content, :category)
	  	end
end
