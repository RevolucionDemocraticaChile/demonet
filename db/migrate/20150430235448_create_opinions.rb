class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.belongs_to :user, index: true
      t.belongs_to :poll, index: true
      t.integer :option

      t.timestamps null: false
    end
    
    add_foreign_key :opinions, :users
    add_foreign_key :opinions, :polls
  end
end
