class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :agenda
      t.integer :author_id
      t.timestamps null: false
    end
    add_foreign_key :comments, :users, column:  :author_id
  end
end
