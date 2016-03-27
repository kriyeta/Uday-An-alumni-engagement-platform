class AddIndexesToUsers < ActiveRecord::Migration
  def change
    add_index :users, :name
    add_index :users, :passout_year
    add_index :users, :current_city
  end
end
