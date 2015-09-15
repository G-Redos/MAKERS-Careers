class WelcomeController < ApplicationController
  def index
    redirect_to jobs_path if user_signed_in?
  end
end
