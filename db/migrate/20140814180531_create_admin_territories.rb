class CreateAdminTerritories < ActiveRecord::Migration
  def change
    create_table :admin_territories do |t|
      t.belongs_to :user
      t.belongs_to :territory

      t.timestamps
    end
  end
end
