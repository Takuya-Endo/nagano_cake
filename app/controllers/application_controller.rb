class ApplicationController < ActionController::Base


  # before_action :authenticate_admin!, unless: proc { admin_signed_in? }

  # before_action :authenticate, except: [:top, :about, :admin_registration]

  # def authenticate

    # if admin_signed_in?
      # before_action :authenticate_admin!

      # def after_sign_in_path_for(resource)
        # '/admin'
      # end
    # else
      # :authenticate_customer!#, except: [:top, :about]
    # end
  # end

  # before_action :authenticate_admin!#,except: [:top]

# before_action :authenticate!

# def authenticate!
  # if admin_signed_in?
    # authenticate_admin!
  # else
    # authenticate_user!
  # end
# end

  # protect_from_forgery with: :exception

# /adminにいけないようにする　かつ　adminログイン後はcustomer/sign/inに遷移しないようにする

# if admin_signed_in?
# before_action :authenticate_customer!
#else
#before_action :authenticate_admin!

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  # def after_sign_out_path_for(resource)
    # case resource
    # when Admin
      # new_admin_session_path
    # when Customer
      # root_path
    # end
  # end

  # def after_sign_out_path_for(resource)
    # if admin_signed_in?
      # '/admin'
    # else
      # root_path
    # end
  # end

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :reject_customer, only: [:create]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active])
  end

  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    if @customer
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
        redirect_to root_path
      end
    end
  end
end
