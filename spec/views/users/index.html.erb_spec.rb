require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :username => "username",
        :email => "valid-email@valid.val",
        :name => "Name",
        password: "thepass",
        password_confirmation: "thepass"
      ),
      User.create!(
        :username => "username2",
        :email => "valid-email2@valid.val",
        :name => "Name",
        password: "thepass",
        password_confirmation: "thepass"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "username".to_s, :count => 1
    assert_select "tr>td", :text => "username2".to_s, :count => 1
    assert_select "tr>td", :text => "valid-email@valid.val".to_s, :count => 1
    assert_select "tr>td", :text => "valid-email2@valid.val".to_s, :count => 1
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
