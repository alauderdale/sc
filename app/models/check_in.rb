class CheckIn < ActiveRecord::Base
	belongs_to :user
  belongs_to :liquor
end
