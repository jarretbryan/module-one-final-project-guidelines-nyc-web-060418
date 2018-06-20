class Dog < ActiveRecord::Base
  has_many :walks
  has_many :walkers, through: :walks
  belongs_to :owner

  def walk_cost(walker_instance)
    if self.size == "Small"
      walker_instance.small_dog_rate
    elsif self.size == "Medium"
      walker_instance.medium_dog_rate
    else
      walker_instance.large_dog_rate
    end
  end

  def book_a_walk(walker, date)
    Walk.create(dog_id: self.id, walker_id: walker.id, walk_time: date)
  end

end
