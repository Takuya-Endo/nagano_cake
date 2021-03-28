class ApplicationController < ActionController::Base

  before_action :authenticate_admin!,except: [:top]
  # before_action :authenticate_customer!,except: []

  protect_from_forgery with: :exception
end
