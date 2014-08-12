require 'rails_helper'

RSpec.describe User, type: :model do

  before { @user = User.new(username: "asdf", email: "asdf@foo.com", name: "asdf",
    password: "thepass", password_confirmation: "thepass") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:name) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

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
    before { @user.username = "a" * (User::USERNAME_MAX_LENGTH+1) }
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { @user.email = "a" * (User::EMAIL_MAX_LENGTH+1) }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * (User::NAME_MAX_LENGTH+1) }
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
      user_with_same_username = User.new(username: @user.username, email:"asdf@aasdfs.asa", name: "asd", password: "thepass1", password_confirmation: "thepass1")
      user_with_same_username.save
    end

    it { should_not be_valid }
  end

  describe "when username is already taken" do
    before do
      user_with_same_username = User.new(username: @user.username, email:"asdf@aasdfs.asa", name: "asd", password: "thepass1", password_confirmation: "thepass1")
      user_with_same_username.username = @user.username.upcase
      user_with_same_username.save
    end

    it { should_not be_valid }
  end

  describe "when email is already taken" do
    before do
      user_with_same_email = User.new(username: "76245", email:@user.email, name: "asda", password: "thepass1", password_confirmation: "thepass1")
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when email is already taken" do
    before do
      user_with_same_email = User.new(username: "76245", email:@user.email, name: "asda", password: "thepass1", password_confirmation: "thepass1")
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  # Password validations

  describe "when password is not present" do
    before do
      @user = User.new(username: "asdf", email: "asdf@foo.com", name: "asdf",
        password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password and password_confirmation don't match" do
    before { @user.password_confirmation = "theWRONGpass" }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to eq false }
    end
  end

  describe "with a password that's too short" do
    before do
      @user.password = @user.password_confirmation = "a" * (User::PASSWORD_MIN_LENGTH - 1)
    end

    it { should be_invalid }
  end




end
