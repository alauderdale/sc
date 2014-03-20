class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar,:storage => :s3, :s3_credentials => S3_CREDENTIALS, :styles => { :medium => "300x300>", :thumb => "100x100>" , :xs => "20x20>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def admin?
    admin
	end
	
end
