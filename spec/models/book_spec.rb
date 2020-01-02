require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :books }
  end

  describe 'methods' do
    it "can calculate average rating" do
      author = Author.create(
        name: "Author"
      )

      book = author.books.create(
        title: "Title",
        pages: 0,
        publication_year: 0
      )

      rating = book.ratings.create(
        title: "Title",
        score: 3,
        comment: "Comment"
      )

      book.ratings << rating

      expect(book.rating_count).to eq(1)
      expect(book.avg_rating).to eq(3)
    end
  end
end
