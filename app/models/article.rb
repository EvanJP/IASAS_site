class Article < ActiveRecord::Base
    validates :title, presence: true, length: {minimum: 5}
    has_attached_file :image
    do_not_validate_attachment_file_type :image
end
