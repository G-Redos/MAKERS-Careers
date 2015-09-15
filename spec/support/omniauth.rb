module OmniauthHelper
  def mock_omniauth_login(user)
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      {
        info:
        {
          email: user.email,
          name: user.name,
          image: user.image_url,
          nickname: user.github_username
        },
        credentials: {
          token: user.auth_token
        },
        provider: 'github',
        uid: user.uid
      }
    )
  end
end
