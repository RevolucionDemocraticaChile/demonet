class AddIndexToUserMeetingsUserIdMeetingId < ActiveRecord::Migration
  def change
    add_index :user_meetings, [:user_id, :meeting_id], unique: true
  end
end
