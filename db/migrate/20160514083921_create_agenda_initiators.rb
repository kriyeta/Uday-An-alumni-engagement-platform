class CreateAgendaInitiators < ActiveRecord::Migration
  def change
    create_table :agenda_initiators do |t|
      t.references :agenda
      t.string :name
      t.integer :initiator_id

      t.timestamps null: false
    end
    add_foreign_key :agenda_initiators, :agendas, column:  :initiator_id
  end
end
