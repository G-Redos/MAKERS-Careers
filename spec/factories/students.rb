FactoryGirl.define do
  factory :student do
    name "Ella Schofield"
    email "ella@makers.com"
    provider "github"
    image_url "http://github.com/ella.jpg"
    github_username "ellanancyfay"
    auth_token "auth-token"
    uid "uid-token"
  end
end
