class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at encrypted_password email id_value id hourlyRentalRate remember_created_at reset_password_sent_at reset_password_token role updated_at]
  end

  def set_role(role)
    update(role: role)
  end
end
