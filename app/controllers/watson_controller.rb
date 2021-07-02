class WatsonController < ApplicationController
    require "ibm_watson/authenticators"
    require "ibm_watson/text_to_speech_v1"
        
    def greetings    
        puts"ENTERED THE CONTROLLER"
        # If using IAM
        authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
        apikey: ENV["WATSON_APIKEY"]
        )

        text_to_speech = IBMWatson::TextToSpeechV1.new(
        authenticator: authenticator
        )
        text_to_speech.service_url = "https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/1ec3ea8a-211a-4dc3-951f-6d32fa16724f"

        # puts JSON.pretty_generate(text_to_speech.list_voices.result)

        File.open("app/assets/audio/welcome.wav", "wb") do |audio_file|
            response = text_to_speech.synthesize(
                text: "Hello current user",
                accept: "audio/wav",
                voice: "en-US_AllisonVoice"
            )
            audio_file.write(response.result)
            puts"END OF THE AUDIO"
        end
    end
end