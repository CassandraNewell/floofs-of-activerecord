class Walker < ActiveRecord::Base
  validates :name, presence: true

  has_many :walks
  has_many :floofs, through: :walks
end
