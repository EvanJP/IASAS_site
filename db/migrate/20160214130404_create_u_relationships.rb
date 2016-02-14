class CreateURelationships < ActiveRecord::Migration
  def change
    create_table :u_relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :u_relationships, :follower_id
    add_index :u_relationships, :followed_id
    add_index :u_relationships, [:follower_id, :followed_id], unique: true
  end
end
