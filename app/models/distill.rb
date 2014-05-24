class Distill < ActiveRecord::Base
	has_attached_file :distill_image,:storage => :s3, :s3_credentials => S3_CREDENTIALS, :styles => { :medium => "300x300>", :thumb => "100x100>" , :xs => "20x20>" }, :default_url => "/images/:style/missing_liquor.png"
	validates_attachment_content_type :distill_image, :content_type => /\Aimage\/.*\Z/
	has_many :liquors, :dependent => :destroy
end
