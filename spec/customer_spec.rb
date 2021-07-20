require 'rails_helper'


RSpec.describe Customer, :type => :model do
    describe "Customer's Model" do
        customer = Customer.new
        customer1 = Customer.new(id: 1, compagny_name: "abcdef", full_name_of_the_company_contact: "hakim antar", company_contact_phone: '418 123-4567', company_description: "desciption en cours",  )
        customer2 = Customer.new(id: 2, compagny_name: "ghijk", full_name_of_the_company_contact: "hakim antar", email_of_the_company_contact: "hakimos@live.ca", company_contact_phone: '418 123-4567', company_description: "desciption en cours",  )

        context 'test if customer work well' do
            it "is valid with valid attributes" do
                expect(customer).to be_valid
            end

            it "verify_email return an array ?" do
                expect(customer.verify_email).to be_kind_of Array
            end
        end

        context 'test email for the customer' do
            it "email cant be empty" do
                expect(customer1.email_of_the_company_contact).to be_falsey
            end

            it "email need to be completed" do
                expect(customer2.email_of_the_company_contact).to be_truthy
            end
        end
    end
end