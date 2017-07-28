require 'rails_helper'

RSpec.describe "a user can logout" do
  it "is a success" do
    user = User.create(username: "test_user", password: "password")
    allow(SessionsController).to receive(:current_user).and_return(user)

    visit "/"

    click_on "Logout"
    expect(current_path).to eq("/login")
  end
end