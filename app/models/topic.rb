class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, presence: true, length: { minimum: 10, maximum: 20 }
  validates :content, presence: true, length: { minimum: 10, maximum: 1000 }
end
