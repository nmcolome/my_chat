require 'rails_helper'

RSpec.describe "a user can login" do
  it "with valid credentials" do
    user = User.create(username: "test_user", password: "password")

    visit "/"
    click_on "Login"

    fill_in "Username", with: "test_user"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq("/")
  end

  it "with invalid credentials" do
    user = User.create(username: "test_user", password: "password")

    visit "/"
    click_on "Login"

    fill_in "Username", with: "wrong"
    fill_in "Password", with: "wrong"
    click_on "Login"

    expect(current_path).to eq("/login")
  end
end