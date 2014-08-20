require 'rails_helper'

describe "Meeting pages" do

  subject { page }

  let(:group)   { FactoryGirl.create(:group)   }
  let(:meeting) { Meeting.create(date: DateTime.now.to_date, desc: "A Desc") }

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

  describe "signing in as admin" do
    let(:signed_in_user) { FactoryGirl.create(:user) }
    before { signed_in_user.update_attribute(:admin, true) }

    before do
      visit ingresar_path
      fill_in "Email",      with: signed_in_user.email
      fill_in "Contraseña", with: signed_in_user.password
      click_button "Ingresar"
    end

    describe "new" do
      before { visit new_meeting_path }
      it { should_not have_selector('div.alert.alert-error') }
      it { should have_content("Nueva reunión") }
      it { should have_button( "Guardar" ) }

      # describe "send valid meeting" do
      #   let(:group) { FactoryGirl.create(:group) }
      #
      #   before do
      #     select "2014",     from: "meeting_date_1i"
      #     select "agosto",   from: "meeting_date_2i"
      #     select "1",        from: "meeting_date_3i"
      #
      #     click_button "Enviar"
      #   end
      #
      #   it { should_not have_selector('div.alert.alert-error') }
      # end

    end

  end

end
