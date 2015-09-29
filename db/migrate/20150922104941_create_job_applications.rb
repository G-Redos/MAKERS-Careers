class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_interests do |t|
      t.belongs_to :job, index: true, foreign_key: true
      t.belongs_to :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
