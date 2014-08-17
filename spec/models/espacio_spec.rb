require 'rails_helper'

RSpec.describe User, type: :model do

	before { @espacio = Espacio.new(name: "Espacio", desc: "Un espacio", type: nil, state: "activo") }

	subject { @espacio }

	it { should respond_to :name }
	it { should respond_to :desc }
	it { should respond_to :type }
	it { should respond_to :state }

	it { should be_valid }

	describe "when name is not present" do
		before { @espacio.name = " " }
		it { should_not be_valid }
	end

	describe "when desc is not present" do
		before { @espacio.desc = " " }
		it { should_not be_valid }
	end

	describe "when state is not present" do
		before { @espacio.state = " " }
		it { should_not be_valid }
	end


end
