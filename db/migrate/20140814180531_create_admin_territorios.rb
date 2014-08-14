class CreateAdminTerritorios < ActiveRecord::Migration
  def change
    create_table :admin_territorios do |t|
      t.belongs_to :user
      t.belongs_to :territorio

      t.timestamps
    end
  end
end
