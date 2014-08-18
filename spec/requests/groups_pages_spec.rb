require 'rails_helper'

describe "Group pages" do

  subject { page }

  describe "without signing in" do
    let(:group) { FactoryGirl.create(:group) }

    describe "index" do
      before { visit groups_path }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq ingresar_path }
    end

    describe "new" do
      before { visit new_group_path }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq ingresar_path }
    end

    describe "show" do
      before { visit group_path(group) }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq ingresar_path }
    end

    describe "edit" do
      before { visit edit_group_path(group) }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq ingresar_path }
    end

  end

  describe "signing in as regular user" do
    let(:signed_in_user) { FactoryGirl.create(:user) }
    let(:group) { FactoryGirl.create(:group) }

    before do
      visit ingresar_path
      fill_in "Email",    with: signed_in_user.email
      fill_in "Contraseña", with: signed_in_user.password
      click_button "Ingresar"
    end

    describe "index" do
      before { visit groups_path }
      it { should_not have_selector('div.alert.alert-error') }
      it { should have_content("Grupos") }
      it { should_not have_link("Nuevo Grupo") }
    end

    describe "new" do
      before { visit new_group_path }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq root_path }
    end

    describe "show" do
      before { visit group_path(group) }
      it { should_not have_selector('div.alert.alert-error') }
      it { should_not have_link("Editar") }
    end

  end

end
