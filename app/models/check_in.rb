class CheckIn < ActiveRecord::Base
	belongs_to :user
  belongs_to :liquor
  has_attached_file :check_in_photo,:storage => :s3, :s3_credentials => S3_CREDENTIALS, :styles => { :medium => "300x300>", :thumb => "100x100>" , :xs => "20x20>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :check_in_photo, :content_type => /\Aimage\/.*\Z/
  acts_as_commentable
  belongs_to :checked_in_liquors, class_name: "Liquor"
end
