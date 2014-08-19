require 'rails_helper'

describe "Territory pages" do

  subject { page }

  describe "without signing in" do
    let(:territory) { FactoryGirl.create(:territory) }

    describe "index" do
      before { visit territories_path }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq ingresar_path }
    end

    describe "new" do
      before { visit new_territory_path }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq ingresar_path }
    end

    describe "show" do
      before { visit territory_path(territory) }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq ingresar_path }
    end

    describe "edit" do
      before { visit edit_territory_path(territory) }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq ingresar_path }
    end

  end

  describe "signing in as regular user" do
    let(:signed_in_user) { FactoryGirl.create(:user) }
    let(:territory)      { FactoryGirl.create(:territory) }

    before do
      visit ingresar_path
      fill_in "Email",      with: signed_in_user.email
      fill_in "Contraseña", with: signed_in_user.password
      click_button "Ingresar"
    end

    describe "index" do
      before { visit territories_path }
      it { should_not have_selector('div.alert.alert-error') }
      it { should have_content("Territorios") }
      it { should_not have_link("Nuevo Territorio") }
    end

    describe "new" do
      before { visit new_territory_path }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq root_path }
    end

    describe "show" do
      before { visit territory_path(territory) }
      it { should_not have_selector('div.alert.alert-error') }
      it { should_not have_link("Editar") }
    end

  end

end
