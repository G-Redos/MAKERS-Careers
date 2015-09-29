require 'rails_helper'

RSpec.describe Job, type: :model do
  it do
    is_expected.to define_enum_for(:status)
      .with([:open, :draft, :closed])
  end

  it { is_expected.to have_many(:students).through(:job_interests) }
  it { is_expected.to have_many(:job_interests) }
end
