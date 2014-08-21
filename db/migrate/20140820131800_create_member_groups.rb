class CreateMemberGroups < ActiveRecord::Migration
  def change
    create_table :member_groups do |t|
      t.belongs_to :user
      t.belongs_to :group

      t.timestamps
    end

    add_index :member_groups, [:user_id, :group_id], unique: true
  end
end
