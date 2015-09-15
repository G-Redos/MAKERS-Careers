class AuthenticateFromGithub

  def initialize(auth, github_client: nil, config: nil)
    @auth = auth
    @client = github_client || Octokit::Client.new(access_token: auth.credentials.token)
    @config = config || Rails.configuration.x.github
  end

  def call
    raise NotAuthorizedError.new unless authorized?
    user
  end

  def self.call(auth)
    new(auth).call
  end

  private

  attr_reader :auth, :client, :config

  def authorized?
    client.organization_member?(config["organization"], username)
  end

  def username
    auth.info.nickname
  end

  def user
    user_type.where(provider: auth.provider, uid: auth.uid).first_or_create(user_args)
  end

  def user_type
    return Admin if admin?
    Student
  end

  def admin?
    client.team_member?(config["staff_team_id"], username)
  end

  def user_args
    {
      email: auth.info.email,
      name: auth.info.name,
      image_url: auth.info.image,
      auth_token: auth.credentials.token,
      github_username: username
    }
  end

  class NotAuthorizedError < StandardError; end
end

