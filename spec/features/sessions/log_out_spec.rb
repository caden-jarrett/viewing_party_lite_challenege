require 'rails_helper'

RSpec.describe "Logging Out With Cookies" do
  it "can delete valid credentials" do
    user = User.create!(email: 'test@gmail.com', name: 'Test', username: 'Testypoo', password:'testtest')
    visit '/'
    click_on "I already have an account"
    expect(current_path).to eq(login_path)
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on "Log In" 
    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Welcome, #{user.username}")

    # sessions test
    click_on "Home"
    expect(page).to_not have_content("Create New User")
    expect(page).to_not have_content("I already have an account")
    expect(page).to have_content("Test has been logged in!")
    expect(page).to have_content("Log Out")

    click_link "Log Out"
    expect(current_path).to eq('/')
    expect(page).to_not have_content("Test has been logged in!")
  end
end