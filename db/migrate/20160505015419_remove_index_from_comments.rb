class RemoveIndexFromComments < ActiveRecord::Migration
  def change
    remove_index :comments, [:user_id, :post_id]
  end
end
