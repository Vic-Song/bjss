class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
  	#stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  	home_index_path
  end


  def after_sign_out_path_for(resource_or_scope)
  	home_index_path
  end

end
