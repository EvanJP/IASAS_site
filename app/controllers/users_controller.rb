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
        if current_user.perms != nil
        if current_user.perms.strip == "athlete"
            params[:events][:id].each do |event|
                if !event.empty?
                    current_user.userevents.build(:event_id => event)
                end
            end
            eventlist = Event.all
            usereventlist = Userevent.all
            eventstring = ""
            Userevent.dedupe
            usereventlist.each do |ue|
                if current_user.id == ue.user_id
                    eventlist.each do |ei|
                        if ei.id == ue.event_id
                            eventstring += ei.event + ","
                        end
                    end
                end
            end
            current_user.events = eventstring
        end
        end
            current_user.school = find_school(current_user.email)
            current_user.save!
            if current_user.update(user_params)
                redirect_to current_user
            else
                render 'edit'
            end
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
            return "N/A"
        end
    end
    
    private
        def user_params
            params.fetch(:user, {}).permit(:avatar, :gender)
        end
end
 