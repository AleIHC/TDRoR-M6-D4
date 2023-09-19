class KpUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :kp_posts
  has_many :kp_comments
  has_one_attached :avatar

  attribute :avatar_url, :string

  enum :role, [:kp_normal_user, :kp_admin]

  def role?(role_name)
    self.role == role_name
  end



end
