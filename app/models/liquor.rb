class Liquor < ActiveRecord::Base
	belongs_to :user
	has_many :comments, :dependent => :destroy
	has_many :check_ins, :dependent => :destroy
	has_many :checked_in_users, :through => :check_ins, :source => :users
	has_attached_file :liquor_image,:storage => :s3, :s3_credentials => S3_CREDENTIALS, :styles => { :medium => "300x300>", :thumb => "100x100>" , :xs => "20x20>" }, :default_url => "/images/:style/missing_liquor.png"
	validates_attachment_content_type :liquor_image, :content_type => /\Aimage\/.*\Z/


	def average_rating
	    @value = 0
	    self.check_ins.each do |rating|
	        @value = @value + rating.rating
	    end
	    @total = self.check_ins.size
	    @value.to_f / @total.to_f
	end

end
