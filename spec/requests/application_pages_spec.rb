require "rails_helper"

describe "root" do
	subject { page }

	before { visit root_path }

	specify { expect(current_path).to eq signin_path }
end
