class CreateWalkers < ActiveRecord::Migration[5.0]
  def change
    create_table :walkers do |t|
      t.string :name
      t.string :username
      t.integer :small_dog_rate
      t.integer :medium_dog_rate
      t.integer :large_dog_rate
      t.integer :rating

    end
  end
end
