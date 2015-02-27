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

class Payment < ActiveRecord::Base

  belongs_to :user

  validates :user_id,
    presence: true

  validates :amount,
    presence: true

end
