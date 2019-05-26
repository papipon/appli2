class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	def user_logged_in?
      if session[:user_id]
      begin
        @current_user = User.find_by(user_id: session[:user_id])
      rescue ActiveRecord::RecordNotFound
        reset_user_session
      end
    end
    return if @current_user
   
      redirect_to new_user_session_path
    end
  
  def reset_user_session
    session[:user_id] = nil
    @current_user = nil
  end

	protected
    
    def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :email])
    	devise_parameter_sanitizer.permit(:sign_in,keys:[:name])
    end
	def after_sign_in_path_for(resource)
	  user_path(current_user)
	end

	def after_sign_up_path_for(resource)
    	user_path(current_user)
  	end

  	def after_sign_out_path_for(resource)
  	root_path
    end
Refile.secret_key = '85e2f0a1626218408d4098181062cea79adfad4069d05c61eea596ffe31cbca436050d0a2453ec81266963fac1d2826bcf25d3aa913feca367c7e19a42d2fc61'
end
