class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook

    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: facebook.capitalize)
      sign_in @user
      redirect_to user_path @user, event: :authentication
    else
      session["devise.facebook_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
  
  def failure
    redirect_to root_path
  end
end