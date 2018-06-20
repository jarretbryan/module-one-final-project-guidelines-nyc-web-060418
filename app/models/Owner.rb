class Owner < ActiveRecord::Base
  has_many :dogs
  has_many :walks, through: :dogs
  has_many :walkers, through: :walks
  # validates :username presence: true

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
    walker_array = Walker.take(5)
    walker_array.each_with_index.map do |walker, index|
      # puts "#{index+1}. #{walker.name.ljust(20)} $#{walker.small_dog_rate.to_s.ljust(5)} $#{walker.small_dog_rate.to_s.ljust(5)} $#{walker.small_dog_rate.to_s.ljust(5)}"
    end
    #binding.pry
    walker_array.map do |walker|
      "#{walker.name} S: $#{walker.small_dog_rate.to_s} M: $#{walker.small_dog_rate.to_s} L: $#{walker.small_dog_rate.to_s}"
    end
  end
end
