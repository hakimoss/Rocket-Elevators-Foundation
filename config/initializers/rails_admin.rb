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
  config.authorize_with do |controller|
    unless current_user&.is_employee?(current_user) ==  true
      redirect_to main_app.root_path
      flash[:error] = "You are not an admin"
    end
  end
end

RailsAdmin.config do |config|
  config.model Address do
    edit do
      field :latitude, :address do
        longitude_field :longitude
        google_api_key 
      end
    end
  end
end
   
# RailsAdmin.config do |config|
#     config.authenticate_with do
#       warden.authenticate! scope: :user
#     end
#     config.current_user_method(&:current_user)
#   end
