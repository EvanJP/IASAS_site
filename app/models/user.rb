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
      :styles => {:thumbnail => "480x480#"},
    default_url: ->(attachment) { ActionController::Base.helpers.asset_path('default.png') }
    do_not_validate_attachment_file_type :avatar
    has_many :userevents
    has_many :active_u_relationships, class_name: "URelationship",
                                        foreign_key: "follower_id",
                                        dependent: :destroy
    has_many :following, through: :active_u_relationships, source: :followed
    
    has_many :passive_u_relationships, class_name: "URelationship",
                                        foreign_key: "followed_id",
                                        dependent: :destroy
    has_many :followers, through: :passive_u_relationships, source: :follower
    
    def follow(other_user)
        active_u_relationships.create(followed_id: other_user.id)
    end
    
    def unfollow(other_user)
        active_u_relationships.find_by(followed_id: other_user.id).destroy
    end
    
    def following?(other_user)
        following.include?(other_user)
    end
end
