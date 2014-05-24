class RemoveFavScotch < ActiveRecord::Migration
  def change
  	remove_column :users, :favorite_scotch
  end
end
