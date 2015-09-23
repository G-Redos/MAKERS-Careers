def create_job(status)
  Job.create({
    status: status,
    name: FFaker::Job.title,
    description: FFaker::Company.catch_phrase,
    roles_available: rand(15),
    company: FFaker::Company.name
  })
end

Job.statuses.keys.each do |status|
  create_job(status)
end

4.times do
  create_job("open")
end

