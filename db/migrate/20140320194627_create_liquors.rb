class CreateLiquors < ActiveRecord::Migration
  def change
    create_table :liquors do |t|
    	t.string :name
      t.string :description
      t.attachment :liquor_image
      t.integer :user_id
      t.timestamps
    end
  end
end
