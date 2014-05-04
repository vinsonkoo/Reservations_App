class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :date
      t.time :time
      t.integer :guests
      t.string :name
      t.string :email
      t.string :phone
      t.string :phone
      t.text :requests

      t.timestamps
    end
  end
end
