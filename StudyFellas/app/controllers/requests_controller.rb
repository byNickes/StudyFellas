class RequestsController < ApplicationController

    def index
        currentgroup = Group.find(params[:id])
        @requests = currentgroup.requests
    end

    def new
        Request.create!(:user_id => params[:user_id], :group_id => params[:group_id])
        redirect_to root_path
    end

    def accept
        request = Request.find(params[:request_id])
        user_id = request.user_id
        group_id = request.group_id
        Request.destroy(params[:request_id])
        redirect_to new_belonging_path(:user_id => user_id, :group_id => group_id)
    end

    def refuse
        Request.destroy(params[:request_id])
    end
end
