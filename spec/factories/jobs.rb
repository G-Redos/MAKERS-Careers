FactoryGirl.define do
  factory :job do
    company FFaker::Company.name
    summary FFaker::Company.catch_phrase
    specification "#Some *markdown*"
    status 'open'
    roles_available 5

    factory :open_job do
      company 'Open Job'
      status 'open'
    end

    factory :closed_job do
      company 'Closed Job'
      status 'closed'
    end

    factory :draft_job do
      company 'Draft Job'
      status 'draft'
    end
  end
end
