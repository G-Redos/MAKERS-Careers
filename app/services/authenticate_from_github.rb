class AuthenticateFromGithub

  def initialize(auth, github_client: nil)
    @auth = auth
    @client = github_client || Octokit::Client.new(access_token: auth.credentials.token)
  end

  def call
    raise NotAuthorizedError.new unless jobseeker?
    student
  end

  def self.call(auth)
    new(auth).call
  end

  private

  attr_reader :auth, :client

  def jobseeker?
    client.organization_member?(Rails.configuration.x.github.organization, auth.info.nickname)
  end

  def student
    Student.where(provider: auth.provider, uid: auth.uid).first_or_create(args)
  end

  def args
    {
      email: auth.info.email,
      name: auth.info.name,
      image_url: auth.info.image,
      auth_token: auth.credentials.token,
      github_username: auth.info.nickname
    }
  end

  class NotAuthorizedError < StandardError; end
end

