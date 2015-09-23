module LoginHelpers
  def login_as_student
    student = FactoryGirl.create(:student)
    login_as(student, scope: :student)
    student
  end

  def login_as_admin
    admin = FactoryGirl.create(:admin)
    login_as(admin, scope: :admin)
    admin
  end
end
