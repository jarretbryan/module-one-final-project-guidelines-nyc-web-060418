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


end
