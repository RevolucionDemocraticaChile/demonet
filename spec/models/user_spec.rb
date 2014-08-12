require 'rails_helper'

USERNAME_MAX_LENGTH = 50
EMAIL_MAX_LENGTH = 50
NAME_MAX_LENGTH = 50

RSpec.describe User, type: :model do

  before { @user = User.new(username: "asdf", email: "asdf@foo.com", name: "asdf") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:name) }

  it { should be_valid }

  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  # length validation

  describe "when username is too long" do
    before { @user.username = "a" * (USERNAME_MAX_LENGTH+1) }
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { @user.email = "a" * (EMAIL_MAX_LENGTH+1) }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * (NAME_MAX_LENGTH+1) }
    it { should_not be_valid }
  end

  # Format validation

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  # Uniqueness validation

  describe "when username is already taken" do
    before do
      user_with_same_username = User.new(username: @user.username, email:"asdf@aasdfs.asa", name: "asd")
      user_with_same_username.save
    end

    it { should_not be_valid }
  end

  describe "when username is already taken" do
    before do
      user_with_same_username = User.new(username: @user.username, email:"asdf@aasdfs.asa", name: "asd")
      user_with_same_username.username = @user.username.upcase
      user_with_same_username.save
    end

    it { should_not be_valid }
  end

  describe "when email is already taken" do
    before do
      user_with_same_email = User.new(username: "76245", email:@user.email, name: "asda")
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when email is already taken" do
    before do
      user_with_same_email = User.new(username: "76245", email:@user.email, name: "asda")
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end



end
