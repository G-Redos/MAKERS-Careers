Rails.application.config.middleware.use OmniAuth::Builder do
  provider(:github,
           Rails.application.secrets.github_client_id,
           Rails.application.secrets.github_application_secret,
           scope: 'user,public_repo')
  on_failure { |env| OmniauthCallbacksController.action(:failure).call(env) }
end
