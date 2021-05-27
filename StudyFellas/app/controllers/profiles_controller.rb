class ProfilesController < ApplicationController
    def show
        
    end
    
    def edit
        session[:profile_set] = 1
    end

    def update
        profile = Profile.where(:user_id => current_user.id).first
        profile.update(:name => params[:name], :surname => params[:surname], :reg_number => params[:reg_number], :province => params[:province], :description => params[:description])
        redirect_to profile_path
    end
end
