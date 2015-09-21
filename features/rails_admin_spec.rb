require "rails_helper"

RSpec.feature "Rails admin login" do

  let(:admin) { FactoryGirl.create(:admin) }

  context "As a logged in admin" do
    before do
      login_as(admin, scope: :admin)
    end

    scenario "I can access the Rails admin page" do
      visit rails_admin_path
      expect(page).to have_content(admin.email)
    end
  end

  context "As an anonymous user" do
    scenario "I cannot access the Rails admin page" do
      visit rails_admin_path
      expect(current_path).to eq(root_path)
    end
  end

  context "As a logged in student" do
    before do
      login_as(admin, scope: :student)
    end

    scenario "I cannot access the Rails admin page" do
      visit rails_admin_path
      expect(current_path).to eq(root_path)
    end
  end
end
