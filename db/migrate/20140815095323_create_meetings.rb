class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.belongs_to :territory
      t.datetime :date
      t.string :summary

      t.timestamps
    end
  end
end
