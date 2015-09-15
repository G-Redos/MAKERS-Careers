class OmniauthCallbacksController < ApplicationController
  include OmniauthHelper

  def github
    sign_in_and_redirect(AuthenticateFromGithub.call(request.env["omniauth.auth"]))
  rescue AuthenticateFromGithub::NotAuthorizedError
    flash[:alert] = t(:"errors.unauthorized")
    redirect_to root_path
  end

  def failure
    flash[:alert] = failure_message
    redirect_to root_path
  end
end
