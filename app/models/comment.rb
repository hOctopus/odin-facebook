class Comment < ActiveRecord::Base
  validates :content, presence: true, length: { minimum: 2, maximum: 140 }
  belongs_to :user
  belongs_to :post

  default_scope -> { order(created_at: :desc) }
end
