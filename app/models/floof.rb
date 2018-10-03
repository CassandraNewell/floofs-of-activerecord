class Floof < ActiveRecord::Base
  has_many :walks
  has_many :walkers, through: :walks

  validates :name, presence: true, uniqueness: true
end
