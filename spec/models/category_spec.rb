require 'rails_helper'

RSpec.describe Category, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_inclusion_of(:category).in_array([ "Clothing", "Tech", "Experiences", "Food", "Books", "Travel" ]) }

    end
end
