class ChangeJobApplicationtoJobInterest < ActiveRecord::Migration
  def change
    rename_table :job_applications, :job_interests
  end
end
