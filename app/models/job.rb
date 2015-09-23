class Job < ActiveRecord::Base
  enum status: [:open, :draft, :closed]

  class << self
    alias_method :all_open, :open
  end
end
