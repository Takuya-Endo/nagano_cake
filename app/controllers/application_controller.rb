class ApplicationController < ActionController::Base

  # before_action :authenticate_user!,except: [:top]

  protect_from_forgery with: :exception
end
