class ProfilesController < ApplicationController
    def show
        if(params[:profile_id] == nil || params[:profile_id] == current_user.profile.id)
            @profile = current_user.profile
        else
            @profile = Profile.where(:id => params[:profile_id]).first
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
    end

    def update
        params.require(:profile).permit(:name, :surname, :reg_number, :province, :description, :image)

        profile = Profile.where(:user_id => current_user.id).first
        if(params[:profile][:image] != nil)
            profile.image.attach(params[:profile][:image])
        end
        profile.update(:name => params[:profile][:name], :surname => params[:profile][:surname], :reg_number => params[:profile][:reg_number], :province => params[:province], :description => params[:profile][:description])
        redirect_to profile_path(:profile_id => current_user.id)
    end

    def delete_profile_picture
        profile = Profile.find(params[:profile_id])
        profile.image.purge
        redirect_to edit_profile_path
    end

end
