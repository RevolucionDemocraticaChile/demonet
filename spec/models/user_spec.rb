require 'rails_helper'

describe User do

  before { @user = User.new(username: "asdf", email: "asdf", name: "asdf") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:name) }

end
