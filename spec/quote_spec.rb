require 'rails_helper'


describe QuotesController, :type => :controller do
  quote1 = Quote.new(name: "corporate", number_of_floor: "", number_of_basement: "", maximum_occupancy:"" )
  quote2 = Quote.new(name: "corporate", number_of_floor: 10, number_of_basement: 16, maximum_occupancy:100 )

  context 'Quote controller' do
    it "returns a 200" do
      request.headers["Authorization"] = "foo"
    end

    it "quote to column :name" do
        QuotesController.should respond_to(:name)
    end

    context 'quote selected corporate' do

      it "value in form cant be empty" do
        expect(quote1.number_of_floor).to be_falsey
        expect(quote1.number_of_basement).to be_falsey
        expect(quote1.maximum_occupancy).to be_falsey
      end

      it "value in form need to be complete" do
        expect(quote2.number_of_floor).to be_truthy
        expect(quote2.number_of_basement).to be_truthy
        expect(quote2.maximum_occupancy).to be_truthy
      end
    end
  end
  
end