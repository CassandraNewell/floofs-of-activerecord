class Floof < ActiveRecord::Base
  validates :name, presence: true

  has_many :walks
  has_many :walkers, through: :walks

  def bark
    "woof"
  end
end
