class FollowRelationship < ApplicationRecord
  belongs_to :follower, class_name: "Customer"
  belongs_to :following, class_name: "Customer"

  validates :follower_id, presence: true
  validates :following_id, presence: true
end
