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

# RailsAdmin.config do |config|
#   config.create_customer.new do |controller|
#     Lead.each.all do |l|
#     if Customer.new.email_of_the_company_contact == l.email
#       client = Dropbox::API::Client.new("zq-PMuGwkRcAAAAAAAAAAYG3Sb4cd65pVGLn4aEBAbGK9D57Vpxnz0QXrM-JAY2o")
#       client.upload l.file.active_storage_blobs
#       destroy_l.file
#       end
#     end
#   end
# end
