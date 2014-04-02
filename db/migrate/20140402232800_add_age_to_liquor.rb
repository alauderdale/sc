class AddAgeToLiquor < ActiveRecord::Migration
  def change
  	add_column :liquors, :age, :integer, :default => ""
  end
end
