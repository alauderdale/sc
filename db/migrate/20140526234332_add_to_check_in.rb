class AddToCheckIn < ActiveRecord::Migration
  def change
  	add_column :check_ins, :nose_rating, :integer, :default => 0
  	add_column :check_ins, :taste_rating, :integer, :default => 0
  	add_column :check_ins, :finish_rating, :integer, :default => 0
  end
end
