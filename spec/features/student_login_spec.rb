require "rails_helper"

RSpec.feature "Student Login" do

  context "Not logged in" do

    let(:student) { FactoryGirl.build(:student) }
    let(:github_members_url) { "https://api.github.com/orgs/makersacademy/members/#{student.github_username}" }
    let(:github_team_id) { Rails.configuration.x.github["staff_team_id"] }
    let(:github_admin_url) { "https://api.github.com/teams/#{github_team_id}/members/#{student.github_username}" }

    before(:each) do
      mock_omniauth_login(student)
      stub_request(:get, github_members_url).to_return(:status => 204)
      stub_request(:get, github_admin_url).to_return(:status => 404)
    end

    scenario "I can log in when I've already registered" do
      student.save
      login
      expect(current_path).to eq(jobs_path)
      expect(page).to have_content(student.name)
    end

    scenario "I can log in when I haven't yet registered" do
      login
      expect(current_path).to eq(jobs_path)
      expect(page).to have_content(student.name)
    end

    scenario "I fail to log in with GitHub" do
      OmniAuth.config.mock_auth[:github] = :invalid_credentials
      login
      expect(page).to have_content("Invalid credentials")
    end

    context "When the student is not a Makers Academy job hunter" do
      before do
        stub_request(:get, github_members_url).to_return(:status => 404)
      end

      scenario "I am not allowed to log in" do
        login
        expect(current_path).to eq(root_path)
        expect(page).to have_content(I18n.t(:'errors.unauthorized'))
      end
    end
  end

  context "Logged in" do

    before do
      login_as(FactoryGirl.create(:student), scope: :student)
    end

    scenario "I am redirected to the jobs page" do
      visit root_path
      expect(current_path).to eq(jobs_path)
    end

    scenario "I signout" do
      visit jobs_path
      click_on I18n.t(:logout_button)
      expect(page).to have_content(I18n.t(:"devise.sessions.signed_out"))
    end
  end

  def login
    visit root_path
    click_on I18n.t(:login_button)
  end
end
