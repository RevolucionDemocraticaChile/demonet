class CreateAdminGroups < ActiveRecord::Migration
  def change
    create_table :admin_groups do |t|
      t.belongs_to :user
      t.belongs_to :group

      t.timestamps
    end

    add_index :admin_groups, [:user_id, :group_id], unique: true
  end
end
