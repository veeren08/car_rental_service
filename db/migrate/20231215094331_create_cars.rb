class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :PlateNumber
      t.string :manufacturer
      t.string :model
      t.float :hourlyRentalRate
      t.string :style
      t.string :status
      t.string :city
      t.string :state
      t.string :country
      t.string :mobile
      t.boolean :approved, default: false
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end
