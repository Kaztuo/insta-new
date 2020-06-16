class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :image, presence: true
  
  def display_image
    image.variant(combine_options:{resize:"300x300^",crop:"300x300+0+0",gravity: :center}).processed
  end
end
