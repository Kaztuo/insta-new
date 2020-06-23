class Like < ApplicationRecord
  belongs_to :photo, class_name: "Photo"
  belongs_to :user, class_name: "User"
  validates_uniqueness_of :photo_id, scope: :user_id
end