# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :string(255)
#  type       :string(255)
#  state      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Group, type: :model do

  before { @group = Group.new(name: "group", desc: "Un Espacio", type: nil, state: "activo") }

  subject { @group }

  it { should respond_to :name }
  it { should respond_to :desc }
  it { should respond_to :type }
  it { should respond_to :state }

  it { should be_valid }

  # Validate name:

  describe "when name is not present" do
    before { @group.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @group.name = "a" * (Group::NAME_MAX_LENGTH + 1) }
    it { should_not be_valid }
  end

  # Validate desc:

  describe "when desc is not present" do
    before { @group.desc = " " }
    it { should be_valid }
  end

  describe "when desc is not present" do
    before { @group.desc = " " }
    it { should be_valid }
  end

  describe "when desc is too long" do
    before { @group.desc = "a" * (Group::DESC_MAX_LENGTH + 1) }
    it { should_not be_valid }
  end

  # Validate state:

  describe "when state is not present" do
    before { @group.state = " " }
    it { should_not be_valid }
  end




end
