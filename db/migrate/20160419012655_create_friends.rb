class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :friend_id
      t.integer :friended_id

      t.timestamps null: false
    end
    add_index :friends, :friend_id
    add_index :friends, :friended_id
    add_index :friends, [:friend_id, :friended_id], unique: true
  end
end
