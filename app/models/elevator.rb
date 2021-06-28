class Elevator < ApplicationRecord
    belongs_to  :column, class_name: "Column", optional: true
end
