class GroupsController < ApplicationController

    def search
        exam_searched = Exam.where(:teacher => params[:teacher], :subject =>params[:subject])
        @province = params[:province]
        if(!exam_searched.empty?)
            @groups = Group.where(:exam_id => exam_searched.first.id)
        else 
            @groups = nil
        end
    end

    def index
        @belongings = current_user.belongings
    end

    def show
        if(params[:id] == "search")
            redirect_to root_path
        else
            group_id = params[:id]
            if(!Group.exists?(:id=>group_id))
                redirect_to root_path
            else
            @group = Group.find(group_id)
                @belongings = @group.belongings
                if(@belongings.where(:user_id => current_user.id).empty? && !current_user.is_admin?)
                    redirect_to root_path
                end
            end
        end
    end

    def new
        @exams = Exam.all
    end

    def create
        if (params[:max_members].to_i > 6 || params[:max_members].to_i < 3)
            flash[:members_error] = "Errore, numero massimo di elementi non valido"
            redirect_to new_group_path
        elsif !Group.where(:exam_id =>  params[:exam_id], :leader_id=> current_user.id).empty?
            flash[:members_error] = "Errore, hai già creato un gruppo per questo esame e docente"
            redirect_to new_group_path
        else
            newgroup = Group.create!(exam_id: params[:exam_id], descrizione: params[:description], max_members: params[:max_members], leader_id: current_user.id)
            redirect_to new_belonging_path(:user_id => current_user.id, :group_id => newgroup.id)
        end
    end

    def upload_file
        params.require(:group).permit(:group_files, :group_id)
        group = Group.find(params[:group][:group_id])
        if(params[:group][:group_files] != nil || !current_user.belongings.where(:group_id => params[:group_id]).empty? || current_user.is_admin)
            group.group_files.attach(params[:group][:group_files])
        end
        redirect_to group_path(group)
    end

    def destroy
        group = Group.find(params[:group_id])
        authorize! :destroy, group, message: "Non sei autorizzato!"
        group.group_files.where(:id=>params[:file]).purge
        redirect_to group_path(group)
    end

    def delete_group
        group = Group.find(params[:group_id])
        authorize! :delete_group, group, message: "Non sei autorizzato!"
        group.group_files.purge
        Belonging.where(:group_id => group.id).delete_all
        group.delete
        redirect_to groups_path
    end

    def delete_participant
        group = Group.find(params[:group_id])

        if(group.leader_id == current_user.id)
            group = Group.find(params[:group_id])
            group.group_files.purge
            Belonging.where(:group_id => group.id).delete_all
            group.delete
        else
            current_user.belongings.where(:group_id => group.id).first.delete
        end
        redirect_to groups_path
    end

    def update
        group = Group.find(params[:id])
        authorize! :update, group, message: "Non sei autorizzato!"
        group.update(exam_id: params[:exam_id], descrizione: params[:description])
        redirect_to group_path(group)
    end

    def edit
        group = Group.find(params[:id])
        authorize! :edit, group, message: "Non sei autorizzato!"
        @exams = Exam.all
    end

    def kick_user
        group = Group.find(params[:group_id])
        authorize! :kick_user, group, message: "Non sei autorizzato!"

        if(params[:user_id].to_i != group.leader_id.to_i)
            user = User.find(params[:user_id])
            user.belongings.where(:group_id => params[:group_id]).first.delete
        else
            flash[:cant_kick] = "Non puoi kickare questo utente."
        end
        redirect_to group_path(group)
    end
end
