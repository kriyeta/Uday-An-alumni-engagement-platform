class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :summary
      t.string :status
      t.string :event_type
      t.string :target_audiance
      t.string :organizers
      t.string :guests
      t.date :event_date
      t.time :event_from_time
      t.time :event_to_time
      t.text :venue
      t.string :image_path
      t.text :details

      t.timestamps null: false
    end
  end
end
