class AddMtimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :mtime, :string
  end
end
