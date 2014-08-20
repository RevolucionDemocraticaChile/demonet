class CreateMeetingGroups < ActiveRecord::Migration
  def change
    create_table :meeting_groups do |t|
      t.belongs_to :meeting
      t.belongs_to :group

      t.timestamps
    end
  end
end
