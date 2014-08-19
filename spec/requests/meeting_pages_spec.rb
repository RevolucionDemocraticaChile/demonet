require 'rails_helper'

describe "Meeting pages" do

  subject { page }

  let(:group)   { FactoryGirl.create(:group)   }
  let(:meeting) { Meeting.create(date: DateTime.now, desc: "A Desc", group_id: group.id) }

  describe "without signing in" do

    describe "index" do
      before { visit meetings_path }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq ingresar_path }
    end

    describe "new" do
      before { visit new_meeting_path }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq ingresar_path }
    end

    describe "show" do
      before { visit meeting_path(meeting) }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq ingresar_path }
    end

    describe "edit" do
      before { visit edit_meeting_path(meeting) }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq ingresar_path }
    end

  end

  describe "signing in as regular user" do
    let(:signed_in_user) { FactoryGirl.create(:user) }

    before do
      visit ingresar_path
      fill_in "Email",      with: signed_in_user.email
      fill_in "Contraseña", with: signed_in_user.password
      click_button "Ingresar"
    end

    describe "index" do
      before { visit meetings_path }
      it { should_not have_selector('div.alert.alert-error') }
      it { should have_content("Reuniones") }
      it { should_not have_link("Nueva Reunión") }
    end

    describe "new" do
      before { visit new_meeting_path }
      it { should have_selector('div.alert.alert-error') }
      specify { expect(current_path).to eq root_path }
    end

    describe "show" do
      before { visit meeting_path(meeting) }
      it { should_not have_selector('div.alert.alert-error') }
      it { should_not have_link("Editar") }
    end

  end

end
