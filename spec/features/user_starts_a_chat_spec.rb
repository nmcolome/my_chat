require 'rails_helper'

RSpec.describe "a user starts a conversation" do
  it "can chat with another user" do
    user = User.create(username: "test_user", password: "password")
    user2 = User.create(username: "test_user2", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on "Chat"
    fill_in :search, with: "#{user2.username}"
    click_on "Add"
    click_on "Go"

    expect(current_path).to eq(private_chat_path)
  end
end