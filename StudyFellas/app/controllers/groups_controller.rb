class GroupsController < ApplicationController


    def index
        @groups = Group.all
    end

    def show
        render html: "nel gruppo"
    end

    def new
        @exams = Exam.all
    end

    def create
        newgroup = Group.create!(exam_id: params[:exam_id], descrizione: params[:description], max_members: params[:max_members])
        redirect_to new_belonging_path(:user_id => current_user.id, :group_id => newgroup.id)
    end


end
