class ApplicationController < ActionController::Base

  before_action :authenticate_admin!,except: [:top]
  # before_action :authenticate_customer!,except: []

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active])
  end

end
