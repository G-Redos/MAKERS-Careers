class Student < ActiveRecord::Base
  devise :rememberable, :trackable
end
