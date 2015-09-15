# This code is copied from Devise's controller code
# for handling failures in the OmniauthCallbackController
# It looks crap (but according to the docs is unavoidable)
# so we thought we'd at least extract it into a helper
#
# Original code:
#
# https://github.com/plataformatec/devise/blob/master/app/controllers/devise/omniauth_callbacks_controller.rb
module OmniauthHelper
  def failed_strategy
    env["omniauth.error.strategy"]
  end

  def failure_message
    exception = env["omniauth.error"]
    error   = exception.error_reason if exception.respond_to?(:error_reason)
    error ||= exception.error        if exception.respond_to?(:error)
    error ||= env["omniauth.error.type"].to_s
    error.to_s.humanize if error
  end
end
