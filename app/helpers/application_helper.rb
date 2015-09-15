module ApplicationHelper
  def current_user
    current_admin || current_student
  end
end
