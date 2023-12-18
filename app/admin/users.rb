ActiveAdmin.register User do
  permit_params :created_at, :email, :id, :updated_at, :password, :role

  controller do
    def action_methods
      if current_admin_user.admin?
        super
      else
        super - ['new', 'update', 'destroy', 'edit', 'create']
      end
    end
  
    def current_ability
      @current_ability ||= Ability.new(current_admin_user)
    end
  end

  # controller do
  #   load_and_authorize_resource
  # end

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :role, as: :select, collection: %w[admin owner]
    end
    f.actions
  end
end
