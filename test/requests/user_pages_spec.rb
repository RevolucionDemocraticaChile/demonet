require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "new" do

		before { visit new_user_path }

		it { should_have content("user") }
	end

end
