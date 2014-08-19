require "rails_helper"

describe "root" do

  subject { page }

  describe "without signing in" do
    before { visit root_path }
    specify { expect(current_path).to eq ingresar_path }
  end


end
