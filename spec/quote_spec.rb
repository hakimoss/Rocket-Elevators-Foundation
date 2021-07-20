require 'rails_helper'


describe QuotesController, :type => :controller do
  context 'Quote controller' do
    it "returns a 200" do
      request.headers["Authorization"] = "foo"
    end
    
    it "quote to column :name" do
        QuotesController.should respond_to(:name)
    end
  end
  
end