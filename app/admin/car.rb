# app/admin/car.rb
ActiveAdmin.register Car do
  permit_params :PlateNumber, :approved, :city, :country, :created_at, :hourlyRentalRate, :id, :id_value, :manufacturer, :mobile, :model, :state, :status, :style, :updated_at

  controller do  
    def scoped_collection
      if current_admin_user.admin?
        Car.all
      else
        Car.where(admin_user_id: current_admin_user.id)
      end
    end

    def current_ability
      @current_ability ||= Ability.new(current_admin_user)
    end
  end

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
      f.input :admin_user_id, as: :select, collection: AdminUser.where(id: current_admin_user.id).map { |u| [u.email, u.id] } if current_admin_user.admin?
    end
    f.actions if current_admin_user.admin? || current_admin_user.owner?
  end

  action_item :approve, only: :show do
    link_to 'Approve Car', approve_admin_car_path(car), method: :put if can?(:approve, Car) && !car.approved
  end

  member_action :approve, method: :put do
    car = Car.find(params[:id])
    car.update(approved: true)
    redirect_to admin_car_path(car), notice: 'Car approved!'
  end
end
