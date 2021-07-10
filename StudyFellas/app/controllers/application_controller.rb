class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, :alert => exception.message
    end

    def after_sign_in_path_for(user)
        if session[:profile_set] == 0
            edit_profile_path
        else
           root_path
        end
    end

end
