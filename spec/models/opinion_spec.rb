# == Schema Information
#
# Table name: opinions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  poll_id    :integer
#  option     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Opinion, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
