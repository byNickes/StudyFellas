class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :surname
      t.integer :reg_number
      t.string :province
      t.text :description, :limit => 1000
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
