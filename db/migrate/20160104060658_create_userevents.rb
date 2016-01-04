class CreateUserevents < ActiveRecord::Migration
  def change
    create_table :userevents do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
