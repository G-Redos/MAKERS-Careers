class Student < ActiveRecord::Base
  devise :rememberable, :trackable

  has_many :job_applications
  has_many :jobs, through: :job_applications
end
