class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :surname
      t.integer :reg_number
      t.string :province
      t.text :description
      t.references :user, null: false

      t.timestamps
    end
  end
end
