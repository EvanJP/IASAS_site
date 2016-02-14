class Article < ActiveRecord::Base
    validates :title, presence: true, length: {minimum: 5}
    has_attached_file :image,
        :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
        :url => "/system/:attachment/:id/:style/:filename",
        :styles => {:thumbnail => "480x480#"}
    do_not_validate_attachment_file_type :image
    has_attached_file :headline,
        :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
        :url => "/system/:attachment/:id/:style/:filename",
        :styles => {:large => "480x1280>"}
end
