require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create!(email: 'test@gmail.com', name: 'Test', username: 'Testypoo', password:'testtest')

    visit '/'

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"
    
    expect(current_path).to eq("/users/#{user.id}")

    expect(page).to have_content("Welcome, #{user.username}")
  end

  it "cannot log in with bad credentials" do
    user = User.create!(email: 'test@gmail.com', name: 'Test', username: 'Testypoo', password:'testtest')

    # we don't have to go through root_path and click the "I have an account" link any more
    visit login_path

    fill_in :username, with: user.username
    fill_in :password, with: "incorrect password"

    click_on "Log In"

    expect(current_path).to eq('/login')

    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end