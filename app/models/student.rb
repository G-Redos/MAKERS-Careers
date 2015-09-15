class Student < ActiveRecord::Base
  devise :omniauthable, :rememberable, :trackable, omniauth_providers: [:github]
end
