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

      @p_delong.books << [@the_book, @the_other_book]

      visit '/books'
    end

    it "i see all book titles author pages and year published" do
      # save_and_open_page
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
  end
end

# User Story 6
# Book Index Page
#
# As a Visitor,
# When I visit a book index page,
# I see all book titles in the database.
# Each book entry on the page shows the author(s) and number of
# pages in the book, and the year it was published.
