class AddActiveMemberUntilToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active_member_until, :date
  end
end
