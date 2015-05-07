class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :name
      t.string :description
      t.datetime :start
      t.datetime :finish
      t.string :options

      t.timestamps null: false
    end
  end
end
