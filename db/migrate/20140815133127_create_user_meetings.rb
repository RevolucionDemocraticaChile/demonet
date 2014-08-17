class CreateUserMeetings < ActiveRecord::Migration
  def change
    create_table :user_meetings do |t|
      t.integer :user_id
      t.integer :meeting_id

      t.timestamps
    end
  end
end
