class AddPermsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :perms, :string
  end
end
