class AddFtimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :ftime, :string
  end
end
