require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :username => "Username",
        :email => "valid-email@valid.val",
        :name => "Name"
      ),
      User.create!(
        :username => "Username2",
        :email => "valid-email2@valid.val",
        :name => "Name"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 1
    assert_select "tr>td", :text => "Username2".to_s, :count => 1
    assert_select "tr>td", :text => "valid-email@valid.val".to_s, :count => 1
    assert_select "tr>td", :text => "valid-email2@valid.val".to_s, :count => 1
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
