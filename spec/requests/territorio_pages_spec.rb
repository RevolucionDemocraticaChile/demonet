require 'rails_helper'

describe "Territorio pages" do

	subject { page }

	describe "without signing in" do
		let(:territorio) { FactoryGirl.create(:territorio) }

		describe "index" do
			before { visit territorios_path }
			it { should have_selector('div.alert.alert-error') }
			specify { expect(current_path).to eq ingresar_path }
		end

		describe "new" do
			before { visit new_territorio_path }
			it { should have_selector('div.alert.alert-error') }
			specify { expect(current_path).to eq ingresar_path }
		end

		describe "show" do
			before { visit territorio_path(territorio) }
			it { should have_selector('div.alert.alert-error') }
			specify { expect(current_path).to eq ingresar_path }
		end

		describe "edit" do
			before { visit edit_territorio_path(territorio) }
			it { should have_selector('div.alert.alert-error') }
			specify { expect(current_path).to eq ingresar_path }
		end

	end

	describe "with signin first" do
		let(:signed_in_user) { FactoryGirl.create(:user) }
		let(:territorio) { FactoryGirl.create(:territorio) }

		before do
			visit ingresar_path
			fill_in "Email",    with: signed_in_user.email
			fill_in "Password", with: signed_in_user.password
			click_button "Ingresar"
		end

		describe "index" do
			before { visit territorios_path }
			it { should_not have_selector('div.alert.alert-error') }
			it { should have_content("Todos los territorios") }
			it { should_not have_link("Nuevo Territorio") }
		end

		describe "new" do
			before { visit new_territorio_path }
			it { should have_selector('div.alert.alert-error') }
			specify { expect(current_path).to eq ingresar_path }
		end

		describe "show" do
			before { visit territorio_path(territorio) }
			it { should_not have_selector('div.alert.alert-error') }
			it { should_not have_link("Editar") }
		end

	end

end
