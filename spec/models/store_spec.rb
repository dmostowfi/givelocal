require "rails_helper"

RSpec.describe Store, type: :model do
  describe "Direct Associations" do
    it { should have_many(:gifts) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:address) }

    it { should validate_uniqueness_of(:phone_number) }

    it { should validate_presence_of(:phone_number) }

    it { should validate_uniqueness_of(:store_name) }

    it { should validate_presence_of(:store_name) }
  end
end
