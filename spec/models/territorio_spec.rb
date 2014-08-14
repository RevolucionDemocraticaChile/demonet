require 'rails_helper'

RSpec.describe Territorio, type: :model do

	before { @territorio = Territorio.new(name: "Europa Norte") }

	subject { @territorio }

	it { should respond_to(:name) }

	it { should be_valid }

	describe "when name is not present" do
		before { @territorio.name = " " }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @territorio.name = "a" * (Territorio::NAME_MAX_LENGTH + 1) }
		it { should_not be_valid }
	end

	describe "when name is taken" do
		before do
			territorio_with_same_name = Territorio.new(name: @territorio.name.upcase)
			territorio_with_same_name.save
		end

		it { should_not be_valid }
	end

end
