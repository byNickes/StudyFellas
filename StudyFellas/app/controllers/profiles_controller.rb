class ProfilesController < ApplicationController
    def show
        
    end
    
    def edit
        session[:profile_set] = 1
        @profile = Profile.where(:user_id => current_user.id).first
    end

    def update
        params.require(:profile).permit(:name, :surname, :reg_number, :province, :description, :image)

        profile = Profile.where(:user_id => current_user.id).first
        profile.image.attach(params[:profile][:image])
        profile.update(:name => params[:profile][:name], :surname => params[:profile][:surname], :reg_number => params[:profile][:reg_number], :province => params[:profile][:province], :description => params[:profile][:description])
        redirect_to profile_path
    end

    def delete_profile_picture
        profile = Profile.find(params[:profile_id])
        profile.image.purge
        redirect_to profile_path
    end

end
