module Eventracker
 class Redmine
  class ActiveRecord

def initialize
 @event = Eventracker::Event
end


 def track(name,description,data = {})
        @event.create! do |e|
          e.visit = data[:issueid]
          e.user = data[:userid]
          e.name = name
          e.description = description
          e.time = data[:datetime]
          e.report = data[:report]
        end
      end

    end
  end
end

