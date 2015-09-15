class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    sign_in_and_redirect(AuthenticateFromGithub.call(request.env["omniauth.auth"]))
  rescue AuthenticateFromGithub::NotAuthorizedError
    flash[:alert] = :'errors.unauthorized'
    redirect_to root_path
  end
end
