require 'rails_helper'

RSpec.describe 'Movie details page', :vcr do
    before :each do
      @user = User.create!(name: "Bernie", email: "bernie@gmail.com", username:'bernster', password:'trumpsucks420')
      visit '/'
      click_on "I already have an account"
      expect(current_path).to eq(login_path)
      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      click_on "Log In" 
    end

    it 'has a button to create a viewing party' do
        visit "/users/discover"
        click_on 'Top Rated'
        
        click_on 'The Shawshank Redemption'
        expect(current_path).to eq(movie_path(278))

        expect(page).to have_link("Discover")

        expect(page).to have_link("Create Viewing Party")

        expect(page).to have_content('The Shawshank Redemption')
        expect(page).to have_content('8.7')
        expect(page).to have_content('2 hours, 22 minutes')
        expect(page).to have_content('Drama')
        expect(page).to have_content('Crime')
        expect(page).to have_content("Framed in the 1940s for the double murder of his wife")
        expect(page).to have_content('Actor/Actress: Tim Robbins Character: Andy Dufresne')
        expect(page).to have_content('7')
    end

end