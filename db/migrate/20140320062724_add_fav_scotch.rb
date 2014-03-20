class AddFavScotch < ActiveRecord::Migration
  def change
  	      add_column :users, :favorite_scotch, :string, :null => false, :default => "Im not sure yet..."
  end
end
