class StaticPagesController < ApplicationController
    def home
    end
    
    def streams
    end
    
    def profiles
        @users = User.all
    end
    
    def hfame
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
