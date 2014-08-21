class CreateUserMeetings < ActiveRecord::Migration
  def change
    create_table :user_meetings do |t|
      t.integer :user_id
      t.integer :meeting_id

      t.timestamps
    end

    add_index :user_meetings, [:user_id, :meeting_id], unique: true
  end
end
