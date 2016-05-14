class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :status
      t.references :agenda
      t.integer :author_id

      t.timestamps null: false
    end
    add_foreign_key :likes, :users, column:  :author_id
  end
end
