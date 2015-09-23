class JobsController < ApplicationController
 def index
   @jobs = Job.all_open
 end
end
