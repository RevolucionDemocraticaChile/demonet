class AddForeignKeysToAdminGroups < ActiveRecord::Migration
  def change
    add_foreign_key :admin_groups, :users
    add_foreign_key :admin_groups, :groups
  end
end
