class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
    	t.string :body
    	#balance rating
    	t.integer :rating, :default => 0
      t.integer :user_id
      t.integer :liquor_id
      t.timestamps
    end
  end
end
