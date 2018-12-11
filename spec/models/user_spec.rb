require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:matches_b) }

    it { should have_many(:matches_a) }

    it { should have_many(:likes) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
