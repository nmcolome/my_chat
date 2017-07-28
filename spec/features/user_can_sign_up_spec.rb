require 'rails_helper'

RSpec.describe "a user can signup" do
  it "with valid credentials" do
    visit "/"
    click_on "signup"

    expect(current_path).to eq("/users/new")
    fill_in :username, with: "test_user"
    fill_in :password, with: "password"
    click_on "Sign Up"

    expect(current_path).to eq("/")
  end
end