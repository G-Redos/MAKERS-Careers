require 'rails_helper'

RSpec.feature 'Student can see list of jobs' do

  before do
    login_as_student
  end

  scenario 'they can see currently available jobs' do
    open_job = FactoryGirl.create(:open_job)
    closed_job = FactoryGirl.create(:closed_job)
    draft_job = FactoryGirl.create(:draft_job)

    visit '/jobs'
    expect(page).to have_content open_job.name
    expect(page).to have_content open_job.description
    expect(page).to have_content open_job.roles_available
    expect(page).not_to have_content draft_job.name
    expect(page).not_to have_content closed_job.name
  end

end
