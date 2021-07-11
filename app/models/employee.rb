class Employee < ApplicationRecord
    belongs_to :user, class_name: "User"
    has_many :batteries
    belongs_to :interventions
end
