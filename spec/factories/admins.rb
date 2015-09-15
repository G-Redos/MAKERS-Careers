FactoryGirl.define do
  factory :admin do
    name "Sanjay"
    email "sanj@makers.com"
    provider "github"
    image_url "http://github.com/sanj.jpg"
    github_username "sanjify"
    auth_token "auth-token"
    uid "uid-token"
  end
end
