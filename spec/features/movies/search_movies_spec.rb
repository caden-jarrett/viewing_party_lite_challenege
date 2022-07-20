require 'rails_helper'

RSpec.describe 'Search Movies', :vcr do

  before :each do
      @user = User.create!(name: "Bernie", email: "bernie@gmail.com", username:'bernster', password:'trumpsucks420')
      visit '/'
      click_on "I already have an account"
      expect(current_path).to eq(login_path)
      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      click_on "Log In" 
  end

  it 'shows movies based on search', :vcr do
    visit "/users/discover"

    fill_in 'query', with: 'Harry'


    click_button 'Search'
    
    expect(current_path).to eq('/movies')
    expect(page.status_code).to eq 200

    

    within "#movie-0" do
      expect(page).to have_link("Harry Potter and the Philosopher's Stone")
      expect(page).to have_content("Average Rating: 7.9")
    end
    within "#movie-2" do
      expect(page).to have_link("Harry Potter and the Chamber of Secrets")
      expect(page).to have_content("Average Rating: 7.7")
    end
    
    within "#movie-39" do
      expect(page).to have_link("Harry & Snowman")
      expect(page).to have_content("Average Rating: 6.7")
    end
  end
end