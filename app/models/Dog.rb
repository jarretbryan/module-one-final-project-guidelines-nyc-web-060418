class Dog < ActiveRecord::Base
  has_many :walks
  has_many :walkers, through: :walks
  belongs_to :owner

  def book_a_walk(walker)
    Walk.create()
  end
end
