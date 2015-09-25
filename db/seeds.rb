# We have to do this to get jobs starting from id 1 again
Job.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE jobs RESTART IDENTITY CASCADE")

def create_job(status)
  Job.create({
    status: status,
    company: FFaker::Company.name,
    specification: FFaker::HipsterIpsum.paragraph,
    summary: FFaker::Company.catch_phrase,
    roles_available: rand(15)
  })
end

Job.statuses.keys.each do |status|
  create_job(status)
end

4.times do
  create_job("open")
end

