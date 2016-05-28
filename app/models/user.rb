class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :friendships,          foreign_key:  :requester_id,
                                  dependent:    :destroy
  has_many :mutual_friendships,   class_name:   "Friendship",
                                  foreign_key:  :requested_id,
                                  dependent:    :destroy

  has_many :friends,        -> { where("friendships.accepted" => true) },
                            through: :friendships,
                            source: :requested
  has_many :mutual_friends, -> { where("friendships.accepted" => true) },
                            through:  :mutual_friendships,
                            source:   :requester

  has_many :sent_requests,      -> { where("friendships.accepted" => false) },
                                through:  :friendships,
                                source:   :requested
  has_many :received_requests,  -> { where("friendships.accepted" => false) },
                                through:  :mutual_friendships,
                                source:   :requester

  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :comments, dependent: :destroy
  has_many :commented_posts, through: :comments, source: :post

  def friends_with?(other_user)
    friends.include?(other_user) || mutual_friends.include?(other_user)
  end

  def request_sent(other_user)
    friendships.find_by(requested_id: other_user, accepted: false)
  end

  def request_received(other_user)
    mutual_friendships.find_by(requester_id: other_user, accepted: false)
  end

  def find_friendship(user)
    friendships.find_by(requested_id: user, accepted: true) || mutual_friendships.find_by(requester_id: user, accepted: true)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name
      # user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
