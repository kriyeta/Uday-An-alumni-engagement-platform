class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :title
      t.string :status
      t.text :solutions
      t.integer :comments_count
      t.integer :likes_count
      t.integer :dislikes_count
      t.integer :creator_id

      t.timestamps null: false
    end
    add_foreign_key :agendas, :users, column:  :creator_id
  end
end
