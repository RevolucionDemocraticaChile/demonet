class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.date   :date
      t.string :desc

      t.timestamps
    end
  end
end
