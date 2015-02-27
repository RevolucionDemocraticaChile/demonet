# == Schema Information
#
# Table name: payments
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  amount      :integer
#  date        :date
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Payment, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
