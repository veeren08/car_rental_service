# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  before_action :authorize_user!
  protect_from_forgery with: :exception

  def current_user
    byebug
    # Your logic to retrieve the current user
  end

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || default_redirect_path
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

  def authorize_user!
    # Implement your authorization logic here
  end

  def authorize_admin!
    # Implement your admin authorization logic here
  end
end
