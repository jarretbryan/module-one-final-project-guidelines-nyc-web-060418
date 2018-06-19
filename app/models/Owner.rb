class Owner < ActiveRecord::Base
  has_many :dogs
  has_many :walks, through: :dogs
  has_many :walkers, through: :walks

  def add_dog(name:, breed:, size:)
    Dog.create(name: name, breed: breed, size: size, owner_id: self.id)
  end

  def view_dogs
    self.dogs.map do |dog|
      dog.name
    end
  end

  def view_my_walkers
    self.dogs.map do |dog|
      dog.walkers.map do |dogg|
        dogg.name
      end
    end.flatten.uniq
  end

  def look_for_walkers
    Walker.take(5)
  end
end
