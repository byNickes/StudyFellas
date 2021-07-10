# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    hd = request.env["omniauth.auth"]["extra"]["id_info"]["hd"]

    if(hd == "studenti.uniroma1.it")
      @user = User.from_omniauth(request.env["omniauth.auth"])
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success",
      kind: "Google"
      

      session[:user_info] = request.env["omniauth.auth"]["info"]

      if(!Profile.exists?(:user_id => @user.id))
        @user.set_user
        session[:profile_set] = 0
        @user.build_default_profile(session[:user_info], @user.id)
      else
        session[:profile_set] = 1
      end
      
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:login_error] = "hai provato a loggare con un account Google non appartenente all'organizzazione studenti.uniroma1.it"
      redirect_to new_user_session_path
    end

  end
end
