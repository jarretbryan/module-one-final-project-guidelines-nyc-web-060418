class Dog < ActiveRecord::Base
  has_many :walks
  has_many :walkers, through: :walks
  belongs_to :owner

end
