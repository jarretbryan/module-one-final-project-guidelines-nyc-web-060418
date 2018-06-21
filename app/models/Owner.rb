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

  def view_walks
    view_walks = view_dog_instances.map do |dog|
      dog.walks.map do |walk|
        walk
      end
    end.flatten
  end

  def view_my_walkers
    view_walks.each_with_index.map do |walk, index|
      {name: "#{index+1}.  Walk Rating: #{walk.rating ? walk.rating.to_s.ljust(9) : "Not rated"} | #{walk.walk_time.strftime("%B %d, %Y")} - #{walk.walker.name} walked #{walk.dog.name}.", value: walk}
    end
  end

  def look_for_walkers
    Walker.where("small_dog_rate is not null and medium_dog_rate is not null and large_dog_rate is not null").all.sample(10).each_with_index.map do |walker, index|
      {name: "#{(index+1).to_s.ljust(3)}. #{walker.name.ljust(30)} Rates - S: $#{walker.small_dog_rate.to_s.ljust(5)} M: $#{walker.medium_dog_rate.to_s.ljust(5)} L: $#{walker.large_dog_rate.to_s.ljust(15)} Rating: #{walker.rating ? walker.rating : "N/A"}", value: walker}
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
