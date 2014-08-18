# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  date       :datetime
#  desc       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @group = FactoryGirl.create(:group)
    @meeting = Meeting.new(group_id: @group.id, date: DateTime.now, desc: "Group Desc")
  end

  subject { @meeting }

  it { should respond_to(:group_id) }
  it { should respond_to(:group)    }
  it { should respond_to(:date)     }
  it { should respond_to(:desc)     }

  it { should be_valid }

  describe "when group doesn't exist" do
    before { @meeting.group_id = 2 }
    it { should_not be_valid }
  end

end
