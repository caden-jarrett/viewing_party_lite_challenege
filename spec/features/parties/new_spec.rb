require 'rails_helper'

RSpec.describe 'Creating a viewing party from a movie show page', :vcr do
    before :each do
        @user1 = User.create!(email: 'jake.taffer@gmail.com', name: 'Jake', username: 'jakeypoo', password:'54321')
        visit '/'
        click_on "I already have an account"
        expect(current_path).to eq(login_path)
        fill_in :username, with: @user1.username
        fill_in :password, with: @user1.password
        click_on "Log In" 
    end

    it 'has a button to create a viewing party', :vcr do
        visit '/users/discover'

        click_on 'Top Rated'

        click_on 'The Shawshank Redemption'

        click_on 'Create Viewing Party'
   
        expect(current_path).to eq('/movies/278/new_party')

        expect(page).to have_content('New Viewing Party for The Shawshank Redemption')
        expect(page).to have_field('Duration', with: 142)
        fill_in 'Date', with: '2014-12-01'
        fill_in 'Time', with: '01:29:18'
        fill_in 'User name', with: 'Jake'
        fill_in 'Duration', with: 150

        click_button 'Create Party'
        
        expect(current_path).to eq('/dashboard')
        
        expect(page).to have_content("Jake, The Shawshank Redemption Viewing Party")
    end
end