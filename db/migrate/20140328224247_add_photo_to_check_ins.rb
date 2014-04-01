class AddPhotoToCheckIns < ActiveRecord::Migration
  def change
  	add_attachment :check_ins, :check_in_photo
  end
end
