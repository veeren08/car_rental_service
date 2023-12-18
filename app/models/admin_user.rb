class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  enum role: [:owner, :admin], _default: :owner
  validates :role, presence: true

  has_many :cars, class_name: "Car"

  scope :admins, -> { where(role: :admin) }
  scope :owners, -> { where(role: :owner) }

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at email id remember_created_at reset_password_sent_at reset_password_token updated_at]
  end
end
