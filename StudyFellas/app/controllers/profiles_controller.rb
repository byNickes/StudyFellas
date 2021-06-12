class ProfilesController < ApplicationController
    def show
        if(params[:format] == current_user.id)
            @profile = current_user.profile
        else
            @profile = Profile.where(:user_id => params[:format]).first
        end

        if(!@profile)
            @profile = current_user.profile
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
        @profile = Profile.where(:user_id => current_user.id).first
    end

    def update
        params.require(:profile).permit(:name, :surname, :reg_number, :province, :description, :image)

        profile = Profile.where(:user_id => current_user.id).first
        if(params[:profile][:image] != nil)
            profile.image.attach(params[:profile][:image])
        end
        profile.update(:name => params[:profile][:name], :surname => params[:profile][:surname], :reg_number => params[:profile][:reg_number], :province => params[:province], :description => params[:profile][:description])
        redirect_to profile_path(:format => current_user.id)
    end

    def delete_profile_picture
        profile = Profile.find(params[:profile_id])
        profile.image.purge
        redirect_to edit_profile_path
    end

end
