# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  date       :date
#  desc       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  state      :string(255)
#  minutes    :text
#  place      :string(255)
#  title      :string(255)
#  start      :datetime
#  finish     :datetime
#

require 'rails_helper'

RSpec.describe Meeting, type: :model do

  before do
    @group = FactoryGirl.create(:group)
    @meeting = Meeting.new(date: DateTime.now.to_date, desc: "Group Desc")
  end

  subject { @meeting }

  # it { should respond_to(:group_id) }
  # it { should respond_to(:group)    }
  it { should respond_to(:date)     }
  it { should respond_to(:desc)     }

  it { should be_valid }

  # describe "when group doesn't exist" do
  #   before { @meeting.group_id = 2 }
  #   it { should_not be_valid }
  # end

end
