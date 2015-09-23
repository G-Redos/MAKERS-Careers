module LoginHelpers
  def login_as_student
    login_as(FactoryGirl.create(:student), scope: :student)
  end

  def login_as_admin
    login_as(FactoryGirl.create(:admin), scope: :admin)
  end
end
