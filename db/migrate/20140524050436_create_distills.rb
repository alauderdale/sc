class CreateDistills < ActiveRecord::Migration
  def change
    create_table :distills do |t|
    		t.string :name
    		t.text :description
    		t.attachment :distill_image
      t.timestamps
    end
  end
end
