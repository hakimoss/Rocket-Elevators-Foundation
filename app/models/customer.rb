class Customer < ApplicationRecord
    belongs_to :company_headquarters_address, class_name: "Address", optional: true
    belongs_to :user, class_name: "User", optional: true
    has_many :buildings
end
