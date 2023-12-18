class Car < ApplicationRecord
  belongs_to :admin_user, class_name: "AdminUser"
  def self.ransackable_attributes(auth_object = nil)
    %w[PlateNumber approved city country created_at hourlyRentalRate id id_value manufacturer mobile model state status style updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    ["admin_user"]
  end
end
