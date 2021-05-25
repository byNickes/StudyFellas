class SetSubjectAndTeacherNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column :exams, :teacher, :string, null: false
    change_column :exams, :subject, :string, null: false
  end
end
