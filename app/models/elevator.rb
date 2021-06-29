class Elevator < ApplicationRecord
    belongs_to  :column, class_name: "Column", optional: true
    
    # before_update :slack
    # def slack
    #     notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
    #     notifier.ping "#{self.status}"
    # end

    after_update :slack
    def slack
        notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
        if self.saved_change_to_status? then
            
            notifier.ping "Elevator ID #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status} to #{self.status}"
        end
    end

    # after_update :slack
    # def slack
    #     notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
    #     notifier.ping "Elevator ID #{self.id} with Serial Number #{self.serial_number} changed status from #{old.self.status} to #{new.self.status}"
    # end
end