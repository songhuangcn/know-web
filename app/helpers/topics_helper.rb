module TopicsHelper
	# 取数据
	def get_banner_data
		@topics_hot ||= get_hot
		@users_score ||= User.all.order(score: :desc).limit(10)
	end

	# 取精华话题
	def get_essence(like_lev = 5)
		Topic.order(created_at: :desc).paginate(page: params[:page], per_page: 25).where('like_count >= ?', like_lev)
	end

	# 取热门话题
	def get_hot(limit = 5)
		Topic.order(reply_count: :desc, view_count: :desc).limit(limit)
	end
end
