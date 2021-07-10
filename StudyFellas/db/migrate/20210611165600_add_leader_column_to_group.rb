class AddLeaderColumnToGroup < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :leader_id, :integer,null:false
  end
end
