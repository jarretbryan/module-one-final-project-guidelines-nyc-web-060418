class ChangeRatingToBeFloatInWalkers < ActiveRecord::Migration[5.0]
  def change
    change_column :walkers, :rating, :float
  end
end
