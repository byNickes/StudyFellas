class AddIndexesToExam < ActiveRecord::Migration[6.1]
  def change
    add_index :exams, [:subject, :teacher], unique: true
  end
end
