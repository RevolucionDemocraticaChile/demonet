class CreateActas < ActiveRecord::Migration
  def change
    create_table :actas do |t|
      t.belongs_to :territorio
      t.datetime :date
      t.string :summary

      t.timestamps
    end
  end
end
