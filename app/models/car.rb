class Car < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[PlateNumber approved city country created_at hourlyRentalRate id id_value manufacturer mobile model state status style updated_at user_id]
  end
end
