class AddInfoToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :state,   :string
    add_column :meetings, :minutes, :string
    add_column :meetings, :place,   :string
    add_column :meetings, :title,   :string
    add_column :meetings, :start,   :datetime
    add_column :meetings, :finish,  :datetime
  end
end
