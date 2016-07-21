class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?


  def add_token_to_user
    Rails.logger.debug "Token ================>" +params[:token]
    @users = User.all
    @users.each do |u|
      if u.role == "bug manager"
        u.trello_token = params[:token]
        if u.save
          render json: {status: "success"}.to_json
        end
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :role,
                                                       :password])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:name, :email, :role, :password,
                                             :current_password])
  end


end
