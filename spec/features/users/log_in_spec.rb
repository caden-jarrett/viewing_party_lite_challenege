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
    
    expect(current_path).to eq('/')

    expect(page).to have_content("Welcome, #{user.username}")
  end
end