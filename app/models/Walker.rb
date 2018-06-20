class Walker < ActiveRecord::Base
  has_many :walks
  has_many :dogs, through: :walks
  belongs_to :owner

  def indv_dogs
    self.dogs.uniq
  end

  def indv_owners
    self.indv_dogs.map do |dog|
      dog.owner
    end
  end

  def walks_with_ratings
    self.walks.select do |walk|
      walk.rating != nil && walk.rating != 0
    end
  end

  def list_of_ratings
    self.walks_with_ratings.map do |walk|
      walk.rating
    end
  end

  def sum_ratings
    self.list_of_ratings.inject {|x,y| x+y}
  end

  def rating_average
    if self.rating == nil
      self.rating = 5
      "N/A"
    else
    avg = ((self.sum_ratings)/(self.list_of_ratings.length).to_f).round(2)
    self.update(rating: avg)
    avg
    end
  end


end
