class Admin < ActiveRecord::Base
  devise :rememberable, :trackable
end
