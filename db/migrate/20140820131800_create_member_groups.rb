class CreateMemberGroups < ActiveRecord::Migration
  def change
    create_table :member_groups do |t|
      t.belongs_to :member
      t.belongs_to :group

      t.timestamps
    end
  end
end
