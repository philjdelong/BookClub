require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i view nav bar", type: :feature do
    it "i see links to home page and books index" do
      visit "/"

      within 'nav' do
        click_link('Home')
        expect(current_path).to eq("/")
      end

      within 'nav' do
        click_link('Books')
        expect(current_path).to eq("/books")
      end
    end
  end
end

# ```
# [ ] done
#
# User Story 2
# Visitor Navigation
#
# As a visitor
# I see a navigation bar
# This navigation bar includes links for the following:
# - a link to return to the welcome / home page of the application ("/")
# - a link to browse all books ("/books")
# ```
