class Book < ApplicationRecord

  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :publication_year

  belongs_to :author
  has_many :ratings

  def avg_rating
    ratings.average(:score).to_f.round(2)
  end

  def rating_count
    ratings.length
  end
end
