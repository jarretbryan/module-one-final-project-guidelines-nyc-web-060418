class Owner < ActiveRecord::Base
  has_many :dogs
  has_many :walks, through: :dogs
  has_many :walkers, through: :walks
  validates :username, presence: true

  def add_dog(name:, breed:, size:)
    Dog.create(name: name, breed: breed, size: size, owner_id: self.id)
  end

  def view_dogs
    Dog.all.select do |dog|
      dog.owner_id == self.id
    end.map do |dog|
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
    Walker.take(5).each_with_index.map do |walker, index|
      "#{index+1}. #{walker.name} - $#{walker.small_dog_rate} - $#{walker.small_dog_rate} - $#{walker.small_dog_rate}"
    end
  end

  def im_a_dog_walker
    Walker.find_or_create_by(username: self.username, name: self.name)
  end

end
