class CreateWalks < ActiveRecord::Migration[5.0]
  def change
    create_table :walks do |t|
      t.integer :rating
      t.integer :cost
      t.reference :dogs
      t.reference :walkers
      t.datetime :walk_time
    end
  end
end
