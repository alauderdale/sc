class Liquor < ActiveRecord::Base
	belongs_to :user
	has_attached_file :liquor_image,:storage => :s3, :s3_credentials => S3_CREDENTIALS, :styles => { :medium => "300x300>", :thumb => "100x100>" , :xs => "20x20>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :liquor_image, :content_type => /\Aimage\/.*\Z/
end
