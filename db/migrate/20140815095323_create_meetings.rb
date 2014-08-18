class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.belongs_to :group
      t.datetime   :date
      t.string     :desc

      t.timestamps
    end
  end
end
