class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friend_relationships, class_name:   "Relationship",
                                  foreign_key:  "friend_id",
                                  dependent:    :destroy
  has_many :friends_with, through: :friend_relationships, source: :friended

  def friend(other_user)
    friend_relationships.create(friended_id: :other_user.id)
  end

  def unfriend(other_user)
    friend_relationships.find_by(friended_id: :other_user.id).destroy
  end

  def friends_with?(other_user)
    friends_with.include?(other_user)
  end
end
