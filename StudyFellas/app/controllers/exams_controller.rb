class ExamsController < ApplicationController
    def index
        authorize! :index, Exam, :message => "Non sei autorizzato"
        @exams = Exam.all
    end

    def create
        authorize! :create, Exam, :message => "Non sei autorizzato"
    end

    def new
        authorize! :new, Exam, :message => "Non sei autorizzato"
        
        if !Exam.exists?(subject: params[:subject], teacher: params[:teacher])
            Exam.create(subject: params[:subject], teacher: params[:teacher])
            redirect_to exams_path
        else
            flash[:already_exists] = "la combinazione esame-docente che stai provando ad aggiungere già esiste"
            redirect_to create_exam_path
        end

    end

    def delete
        authorize! :delete, Exam, :message => "Non sei autorizzato"

        Exam.delete_by(:subject=> params[:subject], :teacher=> params[:teacher])
        redirect_to exams_path
    end
end
