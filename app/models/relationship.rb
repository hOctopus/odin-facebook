class Relationship < ActiveRecord::Base
  belongs_to  :friend,      class_name: "User"
  belongs_to  :friended,    class_name: "User"
  validates   :friend_id,   presence: true
  validates   :friended_id, presence: true
end
