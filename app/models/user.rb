class User < ActiveRecord::Base
    class << self
        def from_omniauth(auth_hash)
            user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
            user.name = auth_hash['info']['name']
            user.location = auth_hash['info']['location']
            user.image_url = auth_hash['info']['image']
            user.url = auth_hash['info']['urls']['user.provide.capitalize']
            user.email = auth_hash['info']['email']
            user.school = find_school(user.email)
            user.events = nil
            user.role = nil
            user.save!
            user
        end
    end
    has_many :userevents
end
