class CreateTerritories < ActiveRecord::Migration
  def change
    create_table :territories do |t|
      t.string :name

      t.timestamps
    end
  end
end
