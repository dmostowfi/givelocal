require "rails_helper"

RSpec.describe MyWish, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:gift) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:gift_id) }

    it { should validate_presence_of(:user_id) }
  end
end
