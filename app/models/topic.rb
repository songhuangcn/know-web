class Topic < ActiveRecord::Base
	# 依赖
	belongs_to :user
	has_many :comments, dependent: :destroy

	# 验证
	validates :title, presence: true, length: { minimum: 6, maximum: 20 }
	validates :content, presence: true, length: { minimum: 10, maximum: 1000 }
	validates :user_id, presence: true

	# 排序问题 修改默认状态很麻烦
	# default_scope -> { order(created_at: :desc) }
end
