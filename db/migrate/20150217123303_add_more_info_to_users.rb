class AddMoreInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthdate, :date
    add_column :users, :city, :string
    add_column :users, :description, :text
    add_column :users, :mobile_number, :string
    add_column :users, :twitter_user, :string
  end
end
