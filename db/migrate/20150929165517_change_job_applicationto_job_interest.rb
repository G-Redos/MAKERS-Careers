class ChangeJobApplicationtoJobInterest < ActiveRecord::Migration
  def change
    rename_table :job_application, :job_interests
  end
end
