class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    #'/an/example/path' # Or :prefix_to_your_route
    link_to_trello_path
  end

  def after_inactive_sign_up_path_for(resource)
    #'/an/example/path' # Or :prefix_to_your_route
    link_to_trello_path
  end

end
