class AddSubjectAndTeacherToExam < ActiveRecord::Migration[6.1]
  def change
    add_column :exams, :subject, :string
    add_column :exams, :teacher, :string
  end
end
