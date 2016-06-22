class User < ActiveRecord::Base
	# 表关系
	has_many :comments, dependent: :destroy
	has_many :topics, dependent: :destroy

	# 验证
	validates :username, presence: true, length: { minimum: 3, maximum: 12 }
	validates :sign, length: { maximum: 50 }

	# 安全验证
	has_secure_password

	# 返回指定字符串的哈希摘要
	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
end
