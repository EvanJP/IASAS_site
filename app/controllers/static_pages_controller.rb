class StaticPagesController < ApplicationController
    def home
        @articles = Article.all
    end
    
    def streams
    end
     
    def gallery
        FlickRaw.api_key = '213bee30b874099c0dbef4ece443d8b6'
        FlickRaw.shared_secret = '1940f2369c4de7b8'

        @photosets = flickr.photosets.getList(user_id: '141699465@N07').map do |set|
            flickr.photosets.getPhotos(photoset_id: set['id']).photo.map do |photo|
                FlickRaw.url_b(photo)
            end
        end
    end
    
    def profiles
        @users = User.all
        @userevents = Userevent.all
        @events = Event.all
    end
    
    def hfame
    end
    
    def results
        
    end
    
    def userprof
    end
    
    def booster
    end
    
    def guidelines
    end
    
    def introletter
    end
    
    def eventlist 
    end
    
    def schedule
        @events = Event.all
        @users = User.all
        @userevents = Userevent.all
    end
end
