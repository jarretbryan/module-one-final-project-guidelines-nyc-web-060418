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

end
