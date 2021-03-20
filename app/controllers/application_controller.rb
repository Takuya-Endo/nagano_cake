class ApplicationController < ActionController::Base

  before_action :authenticate_admin!,except: [:top]

  protect_from_forgery with: :exception
end
