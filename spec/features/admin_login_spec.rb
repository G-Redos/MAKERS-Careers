require "rails_helper"

RSpec.feature "Admin Login" do

  context "Not logged in" do
    let(:admin) { FactoryGirl.build(:admin) }
    let(:github_members_url) { "https://api.github.com/orgs/makersacademy/members/#{admin.github_username}" }
    let(:github_team_id) { Rails.configuration.x.github["staff_team_id"] }
    let(:github_admin_url) { "https://api.github.com/teams/#{github_team_id}/members/#{admin.github_username}" }

    before(:each) do
      mock_omniauth_login(admin)
      stub_request(:get, github_members_url).to_return(:status => 204)
      stub_request(:get, github_admin_url).to_return(:status => 204)
    end

    scenario "I log in and I've already registered" do
      admin.save
      login
      expect(current_path).to eq(jobs_path)
      expect(page).to have_content(admin.name)
    end

    scenario "I log in and I haven't yet registered" do
      login
      expect(current_path).to eq(jobs_path)
      expect(page).to have_content(admin.name)
    end
  end

  context "Logged in" do

    before do
      login_as(FactoryGirl.create(:admin), scope: :admin)
    end

    scenario "I am redirected to the jobs page" do
      visit root_path
      expect(current_path).to eq(jobs_path)
    end
  end

  def login
    visit root_path
    click_on I18n.t(:login_button)
  end
end
