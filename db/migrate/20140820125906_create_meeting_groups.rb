class CreateMeetingGroups < ActiveRecord::Migration
  def change
    create_table :meeting_groups do |t|
      t.belongs_to :meeting
      t.belongs_to :group

      t.timestamps
    end

    add_index :meeting_groups, [:meeting_id, :group_id], unique: true
  end
end
