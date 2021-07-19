require 'elevator_media'


RSpec.configure do |config|
    config.before(:each) do
      stub_request(:get, /v2.jokeapi.dev/).
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: "", headers: {})
    end
end



describe ElevatorMedia::Streamer do
    describe "getContent" do
        context 'test return info' do
            result = ElevatorMedia::Streamer.getContent
            it 'return a joke' do
                expect(ElevatorMedia::Streamer).to respond_to(:getContent)
            end

            it 'should be in div' do 
                expect(result).to include "<div>"
            end

            it 'should receive a String' do 
                expect(result).to be_kind_of String
            end
        end
    end
end