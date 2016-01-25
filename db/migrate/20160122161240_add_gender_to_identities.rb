class AddGenderToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :gender, :string
  end
end
