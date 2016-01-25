class AddDateOfBirthToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :date_of_birth, :date
  end
end
