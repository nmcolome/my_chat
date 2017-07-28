require 'rails_helper'

RSpec.describe "a user can login" do
  xit "with valid credentials" do
    user = User.create(username: "test_user", password: "password")

    visit "/"
    click_on "Login"

    fill_in :username, with: "test_user"
    fill_in :password, with: "password"
    click_on "Login"

    expect(current_path).to eq("/")
  end

  xit "with invalid credentials" do
    user = User.create(username: "test_user", password: "password")

    visit "/"
    click_on "Login"

    fill_in :username, with: "wrong"
    fill_in :password, with: "wrong"
    click_on "Login"

    expect(current_path).to eq("/login")
  end
end