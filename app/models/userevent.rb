class Userevent < ActiveRecord::Base
    belongs_to :user
    belongs_to :event
    
    def self.dedupe
        grouped = all.group_by{|ue| [ue.user_id, ue.event_id]}
        grouped.values.each do |dupes|
            first_one = dupes.shift
            dupes.each{|double| double.destroy}
        end
    end
end
