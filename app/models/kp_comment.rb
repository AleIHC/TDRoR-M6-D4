class KpComment < ApplicationRecord
  belongs_to :kp_user
  belongs_to :kp_post
end
