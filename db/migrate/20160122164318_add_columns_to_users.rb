class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :passout_school, :string
    add_column :users, :passout_year, :string
    add_column :users, :passout_class, :string
    add_column :users, :mobile, :string
    add_column :users, :current_city, :string
    add_column :users, :current_country, :string
    add_column :users, :current_zipcode, :string
    add_column :users, :current_address, :string
    add_column :users, :permanent_address, :string
    add_column :users, :current_occupation_status, :string
    add_column :users, :current_occupation_status_details, :string
    add_column :users, :preferred_time_of_contact, :string
  end
end
