require 'rails_helper'

RSpec.describe 'Top Rated Movies' do

  before :each do
    @user = User.create!(name: "Bernie", email: "bernie@gmail.com", username:'bernster', password:'trumpsucks420')
    visit '/'
    click_on "I already have an account"
    expect(current_path).to eq(login_path)
    fill_in :username, with: @user.username
    fill_in :password, with: @user.password
    click_on "Log In" 
  end

  it 'shows top 40 movies based on rating', :vcr do

    visit '/users/discover'

    click_button 'Top Rated Movies'

    expect(page.status_code).to eq 200
    within "#movie-0" do
      expect(page).to have_link("Shawshank Redemption")
      expect(page).to have_content("Average Rating: 8.7")
    end
    within "#movie-2" do
      expect(page).to have_link("The Godfather")
      expect(page).to have_content("Average Rating: 8.7")
    end
    within "#movie-39" do
      expect(page).to have_link("Hotarubi no Mori e")
      expect(page).to have_content("Average Rating: 8.4")
    end
  end
end