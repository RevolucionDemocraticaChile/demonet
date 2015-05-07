class Opinion < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll

  validates :user,
    presence: true

  validates :poll,
    presence: true

  validates :option,
    presence: :true,
    numericality: { greater_than_or_equal_to: 0 }

  validate :option_within_range

  def option_within_range
    if option >= poll.options.size
      errors.add(:option, "no puede estar fuera de rango.")
    end
  end

end
