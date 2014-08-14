class CreateTerritorios < ActiveRecord::Migration
  def change
    create_table :territorios do |t|
      t.string :name

      t.timestamps
    end
  end
end
