class ChangeTypeToMinutesInMeetings < ActiveRecord::Migration
  def up
    change_column :meetings, :minutes, :text
  end

  def down
    change_column :meetings, :minutes, :string
  end
end
