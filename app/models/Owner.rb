class Owner < ActiveRecord::Base
  has_many :dogs
  has_many :walks, through: :dogs
  has_many :walkers, through: :walks
  has_one :walker

  def add_dog(name:, breed:, size:)
    Dog.create(name: name, breed: breed, size: size, owner_id: self.id)
  end

  def view_dog_instances
    Dog.all.select do |dog|
      dog.owner_id == self.id
    end
  end

  def view_dogs
    view_dog_instances.map do |dog|
      dog.name
    end
  end

  def view_my_walkers
    view_dog_instances.walkers.map do |dog|
        dog.name
    end.flatten.uniq
  end

  def look_for_walkers
    walker_array = Walker.take(5)
    choices = walker_array.each_with_index.map do |walker, index|
      {name: "#{index+1}. #{walker.name.ljust(30)} $#{walker.small_dog_rate.to_s.ljust(5)} $#{walker.medium_dog_rate.to_s.ljust(5)} $#{walker.large_dog_rate.to_s.ljust(5)}", value: walker}
    end
  end

  def select_dog_for_walk(walker_instance)
    choices = self.view_dog_instances.each_with_index.map do |dog, index|
      {name: "#{index+1}. #{dog.name.ljust(15)} #{dog.size.ljust(10)} $#{dog.walk_cost(walker_instance)}", value: dog}
    end
  end

  def become_walker
    Walker.find_or_create_by(name: self.name, owner_id: self.id)
  end
end
