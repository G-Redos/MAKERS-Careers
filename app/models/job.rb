class Job < ActiveRecord::Base
  enum status: [:open, :draft, :closed]

  class << self
    alias_method :all_open, :open
  end

  has_many :job_interests
  has_many :students, through: :job_interests
end
