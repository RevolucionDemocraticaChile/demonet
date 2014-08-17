# == Schema Information
#
# Table name: meetings
#
#  id           :integer          not null, primary key
#  territory_id :integer
#  date         :datetime
#  summary      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe User, type: :model do

	before { @meeting = Meeting.new() }

end
