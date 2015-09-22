require 'rails_helper'

RSpec.describe Student, type: :model do
  it { is_expected.to have_many(:jobs).through(:job_applications) }
end
