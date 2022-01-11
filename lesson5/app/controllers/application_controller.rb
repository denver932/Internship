class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |_exception|
    flash[:alert] = "Access denided"
    redirect_to root_url
  end
end
