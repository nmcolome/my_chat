require 'rails_helper'

RSpec.describe "a user starts a conversation" do
  xit "can chat with another user" do
    user = User.create(username: "test_user", password: "password")
    user2 = User.create(username: "test_user2", password: "password")
    allow(SessionsController).to receive(:current_user).and_return(user)

    visit "/"
    click_on "Chat"
    fill_in :input, with: "Test message"
    click_on "Send"

    expect(page).to have_content("Test message")
    expect(page).to have_content("#{user.username}:")
  end
end