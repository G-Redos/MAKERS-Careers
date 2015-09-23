require 'rails_helper'

RSpec.feature 'Students can register interest in jobs' do

  let!(:student) { login_as_student }

  let!(:job_1) { FactoryGirl.create(:open_job, name: 'Job 1') }
  let!(:job_2) { FactoryGirl.create(:open_job, name: 'Job 2') }

  scenario 'they can click on the apply button to register for a job', js: true do
    visit '/jobs'
    within_each_job do
      click_on 'Apply'
      expect(page).to have_content t(:'jobs.student_interested')
    end
  end

  scenario 'they can see the jobs they have already registered interest for' do
    relate_jobs_to_student
    visit '/jobs'
    within_each_job do
      expect(page).to have_content t(:'jobs.student_interested')
    end
  end

  def jobs
    [job_1, job_2]
  end

  def relate_jobs_to_student
    jobs.each do |job|
      student.jobs << job
    end
  end

  def within_each_job
    jobs.each do |job|
      within("#job_#{job.id}") do
        yield
      end
    end
  end
end
