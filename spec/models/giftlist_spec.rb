require 'rails_helper'

RSpec.describe Giftlist, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:friend_name) }

    it { should validate_presence_of(:gift_id) }

    it { should validate_presence_of(:user_id) }

    end
end
