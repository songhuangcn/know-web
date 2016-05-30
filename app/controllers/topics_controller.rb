class TopicsController < ApplicationController
	# 授权
	before_action :logged_in_user, only: [:create, :destroy]

	def index
		@topics = Topic.paginate(page: params[:page], per_page: 5)
	end

	# 显示文章
	def show
		@topic = Topic.find(params[:id])
	end

	# 删除
	def destroy
		@topic = Topic.find(params[:id])

		if !@topic.delete
			flash.now[:danger] = "删除话题失败！请按要求操作"
			@topics = Topic.paginate(page: params[:page], per_page: 5)
			render 'index'
		else
			flash[:success] = "删除话题“ #{@topic.title} ”成功"
			redirect_to 'index'
		end
	end

	# 新建文章
	def new
		@topic = Topic.new
	end

	def create
    	@topic = current_user.topics.build(topic_params)

		if !@topic.save
			flash.now[:danger] = "创建话题失败！请按要求操作"
			render 'new'
		else
			flash[:success] = "创建话题“ #{@topic.title} ”成功"
			redirect_to @topic
		end
	end
 
 	# 编辑文章
	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])
		if !@topic.update(topic_params)
			flash.now[:danger] = "更新话题失败！请按要求操作"
			render 'edit'
		else
			flash[:success] = "更新话题“ #{@topic.title} ”成功"
			redirect_to @topic
		end
	end

	private
		def topic_params
	    	params.require(:topic).permit(:title, :content, :category)
	  	end
end
