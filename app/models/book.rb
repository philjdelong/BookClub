class Book < ApplicationRecord

  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :publication_year

  belongs_to :author
end
