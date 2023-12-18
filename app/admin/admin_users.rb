# app/admin/admin_user.rb
ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :created_at, :id, :remember_created_at, :reset_password_sent_at, :reset_password_token, :updated_at, :role

  controller do
    def scoped_collection
      if current_admin_user.admin?
        AdminUser.all
      else
        AdminUser.where(id: current_admin_user.id)
      end
    end

    def action_methods
      if can?(:create, AdminUser) && current_admin_user.admin?
        super
      else
        super - ['new', 'edit', 'update', 'destroy']
      end
    end
  
    def current_ability
      @current_ability ||= Ability.new(current_admin_user)
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :role
      unless current_admin_user.admin?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions if current_admin_user.admin? # Display actions only for admin users
  end
end
