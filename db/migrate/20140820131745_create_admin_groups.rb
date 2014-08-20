class CreateAdminGroups < ActiveRecord::Migration
  def change
    create_table :admin_groups do |t|
      t.belongs_to :admin
      t.belongs_to :group

      t.timestamps
    end
  end
end
