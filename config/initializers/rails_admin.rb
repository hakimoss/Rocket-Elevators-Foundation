
RailsAdmin.config do |config|
  config.authorize_with do |controller|
    unless current_user&.is_employee?(current_user) ==  true
      redirect_to main_app.root_path
      flash[:error] = "You are not an admin"
    end
  end
  require Rails.root.join('lib', 'watson.rb')
config.actions do
  dashboard                     # mandatory
  index
  # root               # mandatory
  new
  export
  bulk_delete
  show
  edit
  delete
  show_in_app
  watson

  ## With an audit adapter, you can add:
  # history_index
  # history_show
  end
end

