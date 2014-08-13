require 'rails_helper'

describe "User pages" do

	subject { page }

	describe "show" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.username) }
		it { should have_content(user.email) }
		it { should have_content(user.name) }
	end

end
