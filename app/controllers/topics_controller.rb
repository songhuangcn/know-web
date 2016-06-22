class TopicsController < ApplicationController
	include TopicsHelper

	# 授权
	before_action :logged_in_user, only: [:new, :like, :create, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]

	def index
		@topics = Topic.order(created_at: :desc).paginate(page: params[:page])
		get_banner_data
	end

	# 用户发布
	def user_pub
		@topics = User.find(params[:id]).topics.order(created_at: :desc).paginate(page: params[:page])
		render 'topics/index'
	end

	# 用户回复
	def user_reply
		@topics = Topic.find_by_sql("select * from topics t where user_id=#{params[:id]} or exists (select * from comments where user_id=#{params[:id]} and topic_id=t.id) order by created_at desc limit 10")
		render 'topics/index'
	end

	# 精华栏目
	def essence
		@topics = get_essence
		get_banner_data
		render 'index'
	end

	# 问答栏目
	def ask
		@topics = Topic.where(category: '问答').order(created_at: :desc).paginate(page: params[:page], per_page: 25)
		get_banner_data
		render 'index'
	end

	# 分享栏目
	def share
		@topics = Topic.where(category: '分享').order(created_at: :desc).paginate(page: params[:page], per_page: 25)
		get_banner_data
		render 'index'
	end

	# 瞎扯淡栏目
	def other
		@topics = Topic.where(category: '瞎扯淡').order(created_at: :desc).paginate(page: params[:page], per_page: 25)
		get_banner_data
		render 'index'
	end

	# 显示文章
	def show
		@topic = Topic.find(params[:id])
		@topics_author = @topic.user.topics.limit(5)
		@topics_no_reply = Topic.where(reply_count: 0).limit(5)
		@topics_essence = get_essence

		# 增加积分
		@topic.update_attribute(:view_count, @topic.view_count+1)
	end

	# 删除
	def destroy
		@topic = Topic.find(params[:id])
		
		if !@topic.update_attribute(:deleted, true)
			flash[:danger] = "删除话题失败！请按要求操作"
			redirect_to 'index'
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
			flash.now[:danger] = "创建话题失败！请按要求操作，标题字数不少于6，内容字数不少于10"
			render 'new'
		else
			flash[:success] = "创建话题“ #{@topic.title} ”成功，积分+ #{score(:topic)}"
      		current_user.update(score: current_user.score+score(:topic))
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
			flash[:success] = "更新话题“#{@topic.title}”成功"
			redirect_to @topic
		end
	end

	# like
	def like
		@topic = Topic.find(params[:id])
		if !@topic.update(like_count: @topic.like_count+1)
			flash.now[:danger] = "话题点赞失败！请按要求操作"
			render 'show'
		else
			flash[:success] = "为话题“#{@topic.title}”点赞成功，积分+ #{score(:like)}"
      		current_user.update(score: current_user.score+score(:like))
			redirect_to @topic
		end
	end

	private
		# 确保用户正确
	    def correct_user
	      @user = Topic.find(params[:id]).user

	      if !current_user?(@user)
			flash[:danger] = "禁止操作，不能操作其他用户话题"
	      	redirect_to(root_url) 
	      end
	    end

		def topic_params
	    	params.require(:topic).permit(:title, :content, :category)
	  	end
end
