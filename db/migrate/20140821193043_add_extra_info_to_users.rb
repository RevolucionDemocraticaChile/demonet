class AddExtraInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name,  :string
    add_column :users, :second_name, :string
    add_column :users, :last_name,   :string
    add_column :users, :rut,         :string
  end
end
