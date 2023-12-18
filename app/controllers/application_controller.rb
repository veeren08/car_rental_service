class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authorize_admin!

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || admin_root_path
  end

  def default_redirect_path
    # Customize this method to return the desired default redirect path
    # For example, if you want to redirect users to a specific page:
    # return some_specific_path
    #
    # If you want to redirect users based on their role (assuming you have roles defined):
    # return redirect_path_based_on_role(resource)
    #
    # If you just want to redirect to the root path:
    root_path
  end

  private

  # def authorize_admin!
  #   # Implement your admin authorization logic here
  #   # For example, using Devise's current_user and checking for admin role
  #   unless current_user&.admin?
  #     # Redirect or handle unauthorized access
  #     redirect_to cars_path, alert: 'You are not authorized to access this page.'
  #   end
  # end
end
