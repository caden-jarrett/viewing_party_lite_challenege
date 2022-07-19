require 'rails_helper'

RSpec.describe 'register new user' do

  it "can create a new user" do
    visit '/register'

    expect(page).to have_button("Register New User")

    expect(current_path).to eq('/register')

    fill_in "Name", with: "Lee"
    fill_in "Email", with: "lee@gmail.com"
    fill_in :username, with: "Leemister420"
    fill_in "Password", with: "Sandsofscarab"
    fill_in "Password Confirmation", with: "Sandsofscarab"

    click_button "Register New User"
    
    expect(page).to have_content("Welcome, Leemister420")

    click_on "Home"

    expect(current_path).to eq('/')

    expect(page).to_not have_content("Create New User")

    expect(page).to_not have_content("I already have an account")

    expect(page).to have_content("Lee has been logged in!")

  end
end