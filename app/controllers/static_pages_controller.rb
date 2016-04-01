class StaticPagesController < ApplicationController
    def home
        @articles = Article.all
    end
    
    def streams
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
