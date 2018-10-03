class Walk < ActiveRecord::Base
  belongs_to :floof
  belongs_to :walker

  validates :day, presence: true
end
