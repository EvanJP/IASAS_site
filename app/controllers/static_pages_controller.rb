class StaticPagesController < ApplicationController
    def home
        
    end
    
    def streams
        
    end
    
    def profiles
        @profiles = User.all
    end
    
    def hfame
        
    end
    
    def userprof
        
    end
end
