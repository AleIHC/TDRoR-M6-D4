class KpPost < ApplicationRecord
  belongs_to :kp_user
  has_many :kp_comments, dependent: :destroy

  has_one_attached :kp_image 
end
