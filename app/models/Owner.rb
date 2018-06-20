class Owner < ActiveRecord::Base
  has_many :dogs
  has_many :walks, through: :dogs
  has_many :walkers, through: :walks
  # validates :username presence: true

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
    self.dogs.map do |dog|
      dog.walkers.map do |dogg|
        dogg.name
      end
    end.flatten.uniq
  end

  def look_for_walkers
    walker_array = Walker.take(5)
    choices = walker_array.each_with_index.map do |walker, index|
      {name: "#{index+1}. #{walker.name.ljust(30)} $#{walker.small_dog_rate.to_s.ljust(5)} $#{walker.small_dog_rate.to_s.ljust(5)} $#{walker.small_dog_rate.to_s.ljust(5)}", value: walker}
    end
    # prompt = TTY::Prompt.new
    # prompt.select('Choose a walker:', choices)
  end

  def select_dog_for_walk
    choices = self.view_dog_instances.each_with_index.map do |dog, index|
      {name: "#{index+1}. #{dog.name}", value: dog}
    end
  end
  
end
