FactoryGirl.define do
  factory :job do
    name 'Job'
    company 'makers'
    status 'open'
    description 'An awesome job at makers'
    roles_available 5

    factory :open_job do
      name 'Open Job'
      status 'open'
    end

    factory :closed_job do
      name 'Closed Job'
      status 'closed'
    end

    factory :draft_job do
      name 'Draft Job'
      status 'draft'
    end
  end

end
