class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :title
      t.string :status
      t.text :details
      t.text :solutions
      t.integer :comments_count, :default => 0, :null => false
      t.integer :likes_count, :default => 0, :null => false
      t.integer :dislikes_count, :default => 0, :null => false
      t.integer :creator_id

      t.timestamps null: false
    end
    add_foreign_key :agendas, :users, column:  :creator_id
  end
end
