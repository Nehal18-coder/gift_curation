require 'rails_helper'

RSpec.describe Category, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_inclusion_of(:type_of_postcard).in_array([ "Travel", "Music", "Art", "Inspiration" ]) }

    end
end
