

# RailsAdmin.config do |config|
#   config.authorize_with do 
#     if !current_user
#       config.authenticate_with do
#         warden.authenticate! scope: :user
#       end
#     config.current_user_method(&:current_user)
#     end
#     if current_user && current_user.is_employee?(current_user)
#       true
#     else
#       redirect_to main_app.root_path 
#     end
#   end
# end

RailsAdmin.config do |config|
  
  include IBMWatson
  config.authorize_with do |controller|
    require "json"
    require "ibm_watson/authenticators"
    require "ibm_watson/text_to_speech_v1"
    
    # If using IAM
    authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
      apikey: "998Zx8GmnPlVuQoXYXTD9UsYkRy9okT7-FvY8nQRtija"
    )
    
    # If you have username & password in your credentials use:
    # authenticator = IBMWatson::Authenticators::BasicAuthenticator.new(
    #   username: "{username}",
    #   password: "{password}"
    # )
    
    # If you have username & password in your credentials use:
    text_to_speech = IBMWatson::TextToSpeechV1.new(
      authenticator: authenticator
    )
    text_to_speech.service_url = "https://api.us-east.text-to-speech.watson.cloud.ibm.com"
    
    
    File.new("output.wav", "w+") do |audio_file|
      response = text_to_speech.synthesize(
        text: "Hello world!",
        accept: "audio/wav",
        voice: "en-US_AllisonVoice"
        ).result
        audio_file << response
      end
      
      puts JSON.pretty_generate(text_to_speech.list_voices.result)


    unless current_user&.is_employee?(current_user) ==  true
      redirect_to main_app.root_path
      flash[:error] = "You are not an admin"
    end
  end
end


# RailsAdmin.config do |config|
#     config.authenticate_with do
#       warden.authenticate! scope: :user
#     end
#     config.current_user_method(&:current_user)
#   end


