require 'rails_helper'


RSpec.describe Customer, :type => :model do
    describe "Customer's Model" do
        customer = Customer.new
        # customer2 = Customer.new(:compagny_name)
        context 'test if customer work well' do
            it "is valid with valid attributes" do
                expect(customer).to be_valid
            end

            it "verify_email return an array ?" do
                expect(customer.verify_email).to be_kind_of Array
            end
        end
    end
end