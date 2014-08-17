require 'rails_helper'

RSpec.describe Territory, type: :model do

	before { @territory = Territory.new(name: "Europa Norte") }

	subject { @territory }

	it { should respond_to(:name) }

	it { should be_valid }

	describe "when name is not present" do
		before { @territory.name = " " }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @territory.name = "a" * (Territory::NAME_MAX_LENGTH + 1) }
		it { should_not be_valid }
	end

	describe "when name is taken" do
		before do
			territory_with_same_name = Territory.new(name: @territory.name.upcase)
			territory_with_same_name.save
		end

		it { should_not be_valid }
	end

end
