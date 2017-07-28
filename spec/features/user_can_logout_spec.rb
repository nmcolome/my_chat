require 'rails_helper'

RSpec.describe "a user can logout" do
  it "is a success" do
    user = User.create(username: "test_user", password: "password")
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on "Login"

    fill_in "Username", with: "test_user"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "Logout"
    expect(current_path).to eq("/login")
  end
end