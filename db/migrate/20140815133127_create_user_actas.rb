class CreateUserActas < ActiveRecord::Migration
  def change
    create_table :user_actas do |t|
      t.integer :user_id
      t.integer :acta_id

      t.timestamps
    end
  end
end
