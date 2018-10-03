class Floof < ActiveRecord::Base
  has_many :walks
  has_many :walkers, through: :walks

  validates :name, presence: true

  def bark
    return "woof"
  end
end
