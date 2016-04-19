class Friendship < ActiveRecord::Base
    belongs_to  :requester_id,  class_name: "User"
    belongs_to  :requested_id,  class_name: "User"
    validates   :requester_id,  presence: true
    validates   :requested_id,  presence: true
end
