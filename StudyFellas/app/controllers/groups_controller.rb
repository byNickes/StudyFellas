class GroupsController < ApplicationController


    def index
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
