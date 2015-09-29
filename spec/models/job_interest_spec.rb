require 'rails_helper'

RSpec.describe JobInterest do
  it { is_expected.to belong_to(:job) }
  it { is_expected.to belong_to(:student) }
end
