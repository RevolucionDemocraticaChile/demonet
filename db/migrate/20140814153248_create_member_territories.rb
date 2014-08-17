class CreateMemberTerritories < ActiveRecord::Migration
  def change
    create_table :member_territories do |t|
      t.belongs_to :user
      t.belongs_to :territory

      t.timestamps
    end
  end
end
