require 'rails_helper'

describe "User pages" do

	subject { page }

	describe "show" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.username) }
		it { should have_content(user.email) }
		it { should have_content(user.name) }

		describe "without being logged in" do
			let(:user) { FactoryGirl.create(:user) }
			before { visit user_path(user) }

			it { should_not have_content("Profile") }
			it { should_not have_content(user.username) }
			it { should_not have_content(user.email) }
			it { should_not have_content(user.name) }
		end

	end

	describe "new" do
		before { visit new_user_path }

		it { should have_content("Username") }
		it { should have_content("Name") }
		it { should have_content("Email") }
		it { should have_content("Password") }
		it { should have_content("Password confirmation") }
		it { should have_button("Create User") }
	end

	describe "create new user" do
		before { visit new_user_path }
		let(:submit) { "Create User" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Username",              with: "username"
				fill_in "Email",                 with: "email@email.com"
				fill_in "Name",                  with: "Name Surname"
				fill_in "Password",              with: "thepass"
				fill_in "Password confirmation", with: "thepass"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after creating the user" do
				before { click_button submit }
				let(:user) { User.find_by(email: "email@email.com") }

				it { should have_link("Sign out") }
				it { should have_content(user.name) }
				it { should have_selector('div.alert.alert-success', text: 'User created successfully') }
			end
		end
	end

end
