class AddDistillToScotch < ActiveRecord::Migration
  def change
  	add_column :liquors, :distill_id, :integer, :default => 0
  end
end
