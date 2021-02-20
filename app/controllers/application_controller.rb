class ApplicationController < ActionController::Base
    before_action:configure_permitted_parameters, if: :devise_controller?
    before_action :set_page

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone, :fullname, :description])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :phone, :fullname, :description])
    end

    def set_page
        @users1 = User.all
    end
end
