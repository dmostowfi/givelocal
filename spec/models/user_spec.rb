require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:giftlists) }

    it { should have_many(:wishlists) }
  end

  describe "InDirect Associations" do
    it { should have_many(:wished_gifts) }

    it { should have_many(:gift_options) }
  end

  describe "Validations" do
  end
end
