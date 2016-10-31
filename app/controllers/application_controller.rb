class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #configure redirect to previous url after signin ...
  before_filter :store_current_location, :unless => :devise_controller?

  # def after_sign_in_path_for(resource_or_scope)
  # 	home_index_path
  # end
private

  def store_current_location
    store_location_for(:user,request.url)
  end

  def after_sign_out_path_for(resource_or_scope)
  	request.referrer || home_index_path
  end

end
