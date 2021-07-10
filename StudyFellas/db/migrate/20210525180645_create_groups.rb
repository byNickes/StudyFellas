class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string "descrizione"
      t.integer "max_members"
      t.references :exam, null: false, foreign_key: false
      t.timestamps
    end
  end
end
