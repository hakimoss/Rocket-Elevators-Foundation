require 'elevator_media'


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