class User < ActiveRecord::Base
    class << self
        def from_omniauth(auth_hash)
            user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
            user.name = auth_hash['info']['name']
            user.location = auth_hash['info']['location']
            user.image_url = auth_hash['info']['image']
            user.url = auth_hash['info']['urls']['user.provide.capitalize']
            user.email = auth_hash['info']['email']
            user.save!
            user
        end
    end
    has_attached_file :avatar,
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename",
      :styles => {:small => "150x150>"}
    do_not_validate_attachment_file_type :avatar
    has_many :userevents
end
