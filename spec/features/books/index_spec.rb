require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit book index page", type: :feature do
    before :each do
      @p_delong = Author.create(
        name: "Phil DeLong"
      )

      @the_book = Book.create(
        title: "Dude",
        pages: 50,
        publication_year: 2010
      )

      @the_other_book = Book.create(
        title: "Sweet",
        pages: 60,
        publication_year: 2011
      )

      @rating_1 = Rating.create(
        title: "Great read!",
        score: 5,
        comment: "This is my new favorite book."
      )

      @rating_2 = Rating.create(
        title: "Great read!",
        score: 4,
        comment: "This is my second favorite book."
      )

      @rating_3 = Rating.create(
        title: "Crap read!",
        score: 1,
        comment: "This is my least favorite book"
      )

      @p_delong.books << [@the_book, @the_other_book]

      @the_book.ratings << [@rating_1, @rating_2]
      @the_other_book.ratings << [@rating_3]

      visit '/books'
    end

    it "i see all book titles author pages and year published" do
      within "#book-#{@the_book.id}" do
        expect(page).to have_content("Title: Dude")
        expect(page).to have_content("Author: Phil DeLong")
        expect(page).to have_content("Pages: 50")
        expect(page).to have_content("Publication Year: 2010")
      end

      within "#book-#{@the_other_book.id}" do
        expect(page).to have_content("Title: Sweet")
        expect(page).to have_content("Author: Phil DeLong")
        expect(page).to have_content("Pages: 60")
        expect(page).to have_content("Publication Year: 2011")
      end
    end

    it "i can see rating average and quantity for books" do
      within "#book-#{@the_book.id}" do
        expect(page).to have_content("Avg. Rating: 4.5 (2)")
      end

      within "#book-#{@the_other_book.id}" do
        expect(page).to have_content("Avg. Rating: 1.0 (1)")
      end
    end
  end
end
