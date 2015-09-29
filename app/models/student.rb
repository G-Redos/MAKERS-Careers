class Student < ActiveRecord::Base
  devise :rememberable, :trackable

  has_many :job_interests
  has_many :jobs, through: :job_interests
end
