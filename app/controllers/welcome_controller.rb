class WelcomeController < ApplicationController
  def index
    redirect_to jobs_path if student_signed_in?
  end
end
