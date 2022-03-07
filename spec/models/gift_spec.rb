require 'rails_helper'

RSpec.describe Gift, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:gift_name) }

    it { should validate_presence_of(:photo) }

    it { should validate_presence_of(:store_id) }

    end
end
