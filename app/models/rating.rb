class Rating < ApplicationRecord

  validates_presence_of :title
  validates_presence_of :score
  validates_presence_of :comment

  belongs_to :book
end
