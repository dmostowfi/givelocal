require "rails_helper"

RSpec.describe Gift, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:category) }

    it { should belong_to(:store) }

    it { should have_many(:giftlists) }

    it { should have_many(:wishes) }
  end

  describe "InDirect Associations" do
    it { should have_many(:wishers) }

    it { should have_many(:interested_friends) }
  end

  describe "Validations" do
    it { should validate_presence_of(:category_id) }

    it { should validate_presence_of(:description) }

    it { should validate_presence_of(:gift_name) }

    it { should validate_presence_of(:photo) }

    it { should validate_presence_of(:store_id) }
  end
end
