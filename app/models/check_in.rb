class CheckIn < ActiveRecord::Base
	belongs_to :user
  belongs_to :liquor
  acts_as_commentable
end
