class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  validates :content, presence: true, length: { minimum: 10, maximum: 200 }
end
