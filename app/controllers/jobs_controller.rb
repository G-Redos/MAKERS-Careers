class JobsController < ApplicationController
  def index
    @jobs = Job.all_open
  end

  def apply
    job = Job.find(params[:job_id])
    current_student.jobs << job
    flash[:notice] = t(:'jobs.application_acknowledgement')
    redirect_to jobs_path
  end

  def show
    @job = Job.find(params[:id])
  end
end
