class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :owner, :admin], _default: :user
  validates :role, presence: true

  scope :admins, -> { where(role: :admin) }
  scope :owners, -> { where(role: :owner) }
  scope :regular_users, -> { where(role: :user) }
  
  def set_role(role)
    update(role: role)
  end
end
