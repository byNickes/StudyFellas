class GroupsController < ApplicationController


    def index
        render json: current_user
        @groups = Group.all
    end

    def show
        render html: "nel gruppo"
    end

    def new
        render html: "nella fase di creazione"
    end

    def create
    end


end
