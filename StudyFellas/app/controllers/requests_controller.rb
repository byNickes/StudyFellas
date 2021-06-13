class RequestsController < ApplicationController

    def index
        @currentgroup = Group.find(params[:id])
        @requests = @currentgroup.requests
    end

    def new
        group = Group.find(params[:group_id])
        if (group.belongings.count >= group.max_members)
            redirect_to root_path
        else
            Request.create!(:user_id => params[:user_id], :group_id => params[:group_id])
            redirect_to root_path
        end
    end

    def accept
        request = Request.find(params[:request_id])
        user_id = request.user_id
        group_id = request.group_id
        group = Group.find(group_id)
        Request.destroy(params[:request_id])
        if (group.belongings.count >= group.max_members)
            redirect_to root_path
        else
            redirect_to new_belonging_path(:user_id => user_id, :group_id => group_id)
        end
    end

    def refuse
        Request.destroy(params[:request_id])
        redirect_to group_path(params[:group_id])
    end
end
