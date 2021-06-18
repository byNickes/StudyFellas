class ProfilesController < ApplicationController
    def show
        if(params[:profile_id] == nil || params[:profile_id].to_i == current_user.profile.id)
            @profile = current_user.profile
        else
            @profile = Profile.where(:id => params[:profile_id].to_i).first
        end
        
        user = User.find(@profile.user_id)

        belongings = user.belongings
        @groups = Array.new
        belongings.each do |b|
            @groups.push(Group.find(b.group_id))
        end
    end
    
    def edit
        session[:profile_set] = 1
        if(params[:profile_id] != nil)
            @profile = Profile.where(:id => params[:profile_id]).first
        else
            @profile = Profile.where(:user_id => current_user.id).first
        end

        authorize! :edit, @profile, message: "Non sei autorizzato!"
    end

    def update
        params.require(:profile).permit(:name, :surname, :reg_number, :province, :description, :image, :user_id)

        profile = Profile.where(:user_id => params[:profile][:user_id].to_i).first
        authorize! :update, profile, message: "Non sei autorizzato!"

        if(params[:profile][:image] != nil)
            profile.image.attach(params[:profile][:image])
        end
        profile.update(:name => params[:profile][:name], :surname => params[:profile][:surname], :reg_number => params[:profile][:reg_number], :province => params[:province], :description => params[:profile][:description])
        redirect_to profile_path(:profile_id => current_user.profile.id)
    end

    def delete_profile_picture
        profile = Profile.find(params[:profile_id])
        authorize! :delete_profile_picture, profile, message: "Non sei autorizzato!"

        profile.image.purge
        redirect_to edit_profile_path
    end

end
