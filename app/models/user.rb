class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships,          class_name:   "Friendship",
                                  foreign_key:  "requester_id",
                                  dependent:    :destroy
  has_many :mutual_friendships,   class_name:   "Friendship",
                                  foreign_key:  "requested_id",
                                  dependent:    :destroy

  has_many :friends,        -> where("friendships.accepted" => true),
                            through: :friendships,
                            source: :requested
  has_many :mutual_friends, -> where("friendships.accepted" => true),
                            through:  :mutual_relationships,
                            source:   :requester

  has_many :sent_requests,      -> where("friendships.accepted" => false),
                                through:  :friendships,
                                source:   :requested
  has_many :received_requests,  -> where("friendships.accepted" => false),
                                through:  :mutual_friendships,
                                source:   :requester

  def friends_with?(other_user)
    friends.include?(other_user) || mutual_friends.include?(other_user)
  end

  def request_sent(other_user)
    friends.find_by(requested_id: other_user.id, accepted: false)
  end

  def request_received(other_user)
    mutual_friends.find_by(requester_id: other_user.id, accepted: false)
  end
end
