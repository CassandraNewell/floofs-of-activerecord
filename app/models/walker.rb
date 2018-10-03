class Walker < ActiveRecord::Base
  has_many :walks
  has_many :floofs, through: :walks

  validates :name, presence: true
end
