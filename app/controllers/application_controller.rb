class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #configure redirect to previous url after signin ...
  before_filter :store_current_location, :unless => :devise_controller?

  #configure devsie register parameters
  before_action   :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up,keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

#for authenticating user or admin
 def is_admin?
   redirect_to home_index_path, alert: '请以管理员身份登陆后进行操作！' unless user_signed_in?&&current_user.admin?
 end
 def is_user?
    redirect_to home_index_path, alert: '请登录后进行操作！'  unless user_signed_in?
 end

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
