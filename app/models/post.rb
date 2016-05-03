class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user, dependent: :destroy
end
