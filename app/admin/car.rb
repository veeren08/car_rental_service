# app/admin/car.rb

ActiveAdmin.register Car do
  permit_params :PlateNumber, :approved, :city, :country, :created_at, :hourlyRentalRate, :id, :id_value, :manufacturer, :mobile, :model, :state, :status, :style, :updated_at, :user_id

  index do
    selectable_column
    id_column
    column :PlateNumber
    column :approved
    actions
  end

  form do |f|
    f.inputs 'Car Details' do
      f.input :PlateNumber
      f.input :approved
      # Add other form inputs for other attributes as needed
    end
    f.actions
  end

  action_item :approve, only: :show do
    link_to 'Approve Car', approve_admin_car_path(car), method: :put if !car.approved
  end

  member_action :approve, method: :put do
    car = Car.find(params[:id])
    car.update(approved: true)
    redirect_to admin_car_path(car), notice: 'Car approved!'
  end
end
