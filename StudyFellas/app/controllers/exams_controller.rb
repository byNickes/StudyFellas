class ExamsController < ApplicationController
    def index
        @exams = Exam.all
    end

    def create
        
    end

    def new

        if !Exam.exists?(subject: params[:subject], teacher: params[:teacher])
            Exam.create(subject: params[:subject], teacher: params[:teacher])
            redirect_to exams_path
        else
            flash[:already_exists] = "la combinazione esame-docente che stai provando ad aggiungere già esiste"
            redirect_to create_exam_path
        end

    end

    def delete
        Exam.delete_by(:subject=> params[:subject], :teacher=> params[:teacher])
        redirect_to exams_path
    end
end
