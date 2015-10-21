# -*- encoding : utf-8 -*-
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(*providers)
    providers.each do |provider|
      class_eval %Q{
        def #{provider}
          if !current_user.blank?
            current_user.bind_service(env["omniauth.auth"])#Add an auth to existing
            redirect_to setting_path, :notice => "Bind #{provider} account successfully."
          else
            @user = User.find_or_create_for_#{provider}(env["omniauth.auth"])
  
            if @user.persisted?
              @user.skip_confirmation!
              flash[:notice] = "Signed in with #{provider.to_s.titleize} successfully."
              
              auth = request.env['omniauth.auth']
              token = auth[:credentials][:token]
              session[:fb_access_token] = token 
              
             sign_in_and_redirect @user, :event => :authentication, :notice => "Signed in successfully."
            else
              render "devise/registrations/new"
            end
          end
        end
      }
    end
  end
  
  provides_callback_for :facebook

  # This is solution for existing accout want bind Google login but current_user is always nil
  # https://github.com/intridea/omniauth/issues/185
  def handle_unverified_request
    true
  end


end
