class JobsController < ApplicationController
  def index
    @jobs = Job.all_open
  end

  def apply
    job = Job.find(params[:job_id])
    current_student.jobs << job
    current_student.save!
    render json: {text: I18n.t(:'jobs.student_interested')}
  end
end
