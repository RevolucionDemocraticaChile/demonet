require 'rails_helper'

# RSpec.describe "AuthenticationPages", :type => :request do
#   describe "GET /authentication_pages" do
#     it "works! (now write some real specs)" do
#       get authentication_pages_index_path
#       expect(response.status).to be(200)
#     end
#   end
# end

describe "Authentication" do
  subject { page }

  describe "new" do
    before { visit new_session_path }

    it { should have_content('Email') }
    it { should have_content('Password') }
    it { should have_content('Ingresar') }
  end

  describe "signin" do
    before { visit ingresar_path }

    it { should have_content('Ingresar') }

    describe "with invalid information" do
      before { click_button 'Ingresar' }

      it { should have_selector("div.alert.alert-error") }

      describe "after visiting another page" do
        before { click_link "Demonet" }
        it { should_not have_selector("div.alert.alert-error") }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }

      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Contraseña", with: user.password
        click_button "Ingresar"
      end

      it { should have_content(user.name) }
      it { should have_link('Perfil',  href: user_path(user)) }
      it { should have_link('Salir', href: salir_path)    }
      it { should_not have_link('Ingresar', href: ingresar_path) }

      describe "followed by signout" do
        before { click_link "Salir" }
        specify { expect(current_path).to eq ingresar_path }
      end

    end
  end

end
