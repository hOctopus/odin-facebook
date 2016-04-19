class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :active_relationships,   class_name:   "Relationship",
                                    foreign_key:  "friend_id",
                                    dependent:    :destroy
  has_many :passive_relationships,  class_name:   "Relationship",
                                    foreign_key:  "friended_id",
                                    dependent:    :destroy
  has_many  :friends_with,  through: :active_relationships,   source: :friended
  has_many  :friends,       through: :passive_relationships

  def friend(other_user)
    active_relationships.create(friended_id: :other_user.id)
  end

  def unfriend(other_user)
    active_relationships.find_by(friended_id: :other_user.id).destroy
  end

  def friends_with?(other_user)
    friends_with.include?(other_user)
  end
end
