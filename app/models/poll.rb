class Poll < ActiveRecord::Base

  serialize :options, Array

  has_many :opinions
end
