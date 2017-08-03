require 'rails_helper'

RSpec.describe "a user starts a conversation" do
  it "can chat with another user" do
    user = User.create(username: "test_user", password: "password")
    user2 = User.create(username: "test_user2", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on "Open a private chat"
    select "#{user2.username}", from: "participant_ids[]"
    click_on "Go"

    expect(page).to have_content("This is the beginning of your private conversation with #{user2.username}")
  end
end