class GroupsController < ApplicationController


    def index
        @belongings = current_user.belongings
    end

    def show
        group_id = params[:id]
        @group = Group.find(group_id)
        @belongings = @group.belongings
    end

    def new
        @exams = Exam.all
    end

    def create
        newgroup = Group.create!(exam_id: params[:exam_id], descrizione: params[:description], max_members: params[:max_members])
        redirect_to new_belonging_path(:user_id => current_user.id, :group_id => newgroup.id)
    end

    def upload_file
        params.require(:group).permit(:group_files, :group_id)
        group = Group.find(params[:group][:group_id])
        if(params[:group][:group_files] != nil)
            group.group_files.attach(params[:group][:group_files])
        end
        redirect_to group_path(group)
    end

    def destroy
        group = Group.find(params[:group_id])
        group.group_files.where(:id=>params[:file]).purge
        redirect_to group_path(group)
    end

end
