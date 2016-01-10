class UsersController < ApplicationController
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    helper_method :current_user
    
    def show
        if current_user.events != nil
            @eventarr = current_user.events.split
        end
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
        #Method for saving events to User table
        #Create empty event list
        #Remove repeatted occurences
        #Save all events from userevents matching into empty list
        #Add all events that match UserEvents id and Eventid to a string
        #Add string to User.event
        #Save user
        eventlist = Event.all
        usereventlist = Userevent.all
        eventstring = ""
        Userevent.dedupe
        usereventlist.each do |ue|
            if current_user.id == ue.user_id
                eventlist.each do |ei|
                    if ei.id == ue.event_id
                        eventstring += ei.event + " "
                    end
                end
            end
        end
        current_user.events = eventstring
        current_user.school = find_school(current_user.email)
        current_user.save!
        redirect_to current_user
    end
    
    def find_school(school = '')
        loc = school.index('@')
        if school[loc, school.length - 1].include? "tas"
            return "TAS"
        elsif school[loc, school.length - 1].include? "ism"
            return "ISM"
        elsif school[loc, school.length - 1].include? "iskl"
            return "ISKL"
        elsif school[loc, school.length - 1].include? "sas"
            return "SAS"
        elsif school[loc, school.length - 1].include? "isb"
            return "ISB"
        elsif school[loc, school.length - 1].include? "jis"
            return "JIS"
        else
            return "TAS"
        end
    end
end

 