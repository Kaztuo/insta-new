class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :image, presence: true
  
  def display_image
    image.variant(combine_options:{resize:"500x500^",crop:"500x500+0+0",gravity: :center}).processed
  end
end
