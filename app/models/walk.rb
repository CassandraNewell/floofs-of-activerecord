class Walk < ActiveRecord::Base
  validates :day, presence: true

  belongs_to :floof, required: true
  belongs_to :walker, required: true
end
