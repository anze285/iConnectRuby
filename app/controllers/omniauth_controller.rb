class OmniauthController < ApplicationController

    def facebook
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        @user1 = User.where(email: @user.email)
        if @user1.exists?
            if @user.persisted?
                sign_in_and_redirect @user
                #set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
            else
                flash[:error] = 'There was a problem signing in through Facebook. Please register or try signing in later.'
                redirect_to new_user_registration_path, alert: "There was a problem signing in through Facebook. Please register or try signing in later." #url
        end
        else
            redirect_to new_user_registration_path, alert: "User with that email already exists."
        end        
    end

    def google_oauth2
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        @user1 = User.where(email: @user.email)
        if @user1.exists?
            if @user.persisted?
                sign_in_and_redirect @user
                #set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
            else
                flash[:error] = 'There was a problem signing in through Google. Please register or try signing in later.'
                redirect_to new_user_registration_path, alert: "There was a problem signing in through Google. Please register or try signing in later." #url
            end
        else
            redirect_to new_user_registration_path, alert: "User with that email already exists."
        end
    end

    def failure
        flash[:error] = 'There was a problem logging you in. Please register or try signing in later.'
        redirect_to new_user_registration_path
    end

    #def set_flash_message!(key, kind, options = {})
    #    if is_flashing_format?
    #        set_flash_message(key, kind, options)
    #    end
    #end

end
