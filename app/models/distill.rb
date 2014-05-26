class Distill < ActiveRecord::Base
	has_attached_file :distill_image,:storage => :s3, :s3_credentials => S3_CREDENTIALS, :styles => { :medium => "300x300>", :thumb => "100x100>" , :xs => "20x20>" }, :default_url => "/images/:style/missing_liquor.png"
	validates_attachment_content_type :distill_image, :content_type => /\Aimage\/.*\Z/
	has_many :liquors, :dependent => :destroy

	# It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name ilike ?", "%#{query}%") 
  end 
end
