class AddColumnsToIdentity < ActiveRecord::Migration
  def change
    add_column :identities, :passout_year, :string
    add_column :identities, :passout_class, :string
    add_column :identities, :current_city, :string
    add_column :identities, :current_country, :string
    add_column :identities, :current_address, :string
    add_column :identities, :permanent_address, :string
    add_column :identities, :current_occupation_status, :string
    add_column :identities, :current_occupation_status_details, :string
    add_column :identities, :preferred_time_of_contact, :string
  end
end
