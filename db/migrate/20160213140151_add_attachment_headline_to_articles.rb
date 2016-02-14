class AddAttachmentHeadlineToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|

      t.attachment :headline

    end
  end

  def self.down

    remove_attachment :articles, :headline

  end
end
