class UsersController < ApplicationController
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    helper_method :current_user
    
    def show
        
    end
    
    def edit
        @all_events = Event.all
        @user_events = current_user.userevents.build
    end
   
    def update
        params[:events][:id].each do |event|
            if !event.empty?
                current_user.userevents.build(:event_id => event)
            end
        end
        current_user.save!
        redirect_to current_user
    end   
end
 