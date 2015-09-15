require "spec_helper"
require "./app/services/authenticate_from_github"
require "ostruct"

RSpec.describe AuthenticateFromGithub do
  subject(:service) { described_class.new(auth, github_client: client) }

  let(:auth) { AuthFake.new }
  let(:client) { double(:client) }
  let(:student_args) do
    {
      email: auth.info.email,
      name: auth.info.name,
      image_url: auth.info.image,
      auth_token: auth.credentials.token,
      github_username: auth.info.nickname
    }
  end

  it "authenticates and registers a student" do
    stub_github(true)
    stub_db
    expect(service.call).to eq(:student)
  end

  context "when not a Makers Academy jobseeker" do

    it "doesn't authenticate" do
      stub_github(false)
      expect { service.call }.to raise_error(AuthenticateFromGithub::NotAuthorizedError)
    end
  end

  def stub_github(return_value)
    allow(client).to receive(:organization_member?).and_return(return_value)
  end

  def stub_db
    query = double(:query)
    student = class_spy("Student").as_stubbed_const
    allow(student).to receive(:where).with(provider: auth.provider, uid: auth.uid).and_return(query)
    allow(query).to receive(:first_or_create).with(student_args).and_return(:student)
  end

  class AuthFake
    def provider
      'github'
    end

    def uid
      '1234567'
    end

    def info
      OpenStruct.new(email: "leo@makers.com", name: "Leo", image: "image", nickname: "pitchinvasion")
    end

    def credentials
      OpenStruct.new(token: "foobar")
    end
  end
end
