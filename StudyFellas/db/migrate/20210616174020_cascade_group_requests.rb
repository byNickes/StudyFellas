class CascadeGroupRequests < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :requests, :groups
    add_foreign_key :requests, :groups, column: :group_id, on_delete: :cascade
  end
end
