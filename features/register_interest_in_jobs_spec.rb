require 'rails_helper'

RSpec.feature 'Students can register interest in jobs' do

  let!(:student) { login_as_student }

  let!(:job_1) { FactoryGirl.create(:open_job, company: 'Job 1') }
  let!(:job_2) { FactoryGirl.create(:open_job, company: 'Job 2') }

  scenario 'they can click on the apply button to register for a job' do
    click_on_job
    click_on t(:'jobs.apply_button')
    expect(page).to have_content t(:'jobs.application_acknowledgement')
  end

  scenario 'they cannot apply for the same job twice' do
    relate_jobs_to_student
    click_on_job
    expect(page).not_to have_content t(:'jobs.apply_button')
  end

  def jobs
    [job_1, job_2]
  end

  def click_on_job
    visit '/jobs'
    within("#job_#{job_1.id}") do
      click_on t(:'jobs.read_specification')
    end

  end

  def relate_jobs_to_student
    jobs.each do |job|
      student.jobs << job
    end
  end
end
