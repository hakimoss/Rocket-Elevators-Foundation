class Elevator < ApplicationRecord
    belongs_to  :column, class_name: "Column", optional: true
    
   

    # after_update :slack
    # def slack
    #     notifier = Slack::Notifier.new (ENV["SLACK_APIKEY1"])
    #     if self.saved_change_to_status? then
            
    #         notifier.ping "Elevator ID #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status} to #{self.status}"
    #     end
    # end

    after_update :slack
    def slack
        notifier = Slack::Notifier.new (ENV["SLACK_APIKEY"])
        if self.saved_change_to_status? then            
            notifier.ping "Elevator ID #{self.id} with Serial Number #{self.serial_number} changed status to #{self.status}"
        end
    end
end