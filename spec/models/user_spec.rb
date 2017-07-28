require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes" do
    it { is_expected.to respond_to(:username) }
    it { is_expected.to respond_to(:password) }
  end
end
