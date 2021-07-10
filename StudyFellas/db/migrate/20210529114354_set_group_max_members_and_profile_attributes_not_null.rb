class SetGroupMaxMembersAndProfileAttributesNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column :groups, :max_members, :integer, null: false
    change_column :profiles, :name, :string, null: false
    change_column :profiles, :surname, :string, null: false
    change_column :profiles, :reg_number, :integer, null: false
    change_column :profiles, :province, :string, null: false
  end
end
