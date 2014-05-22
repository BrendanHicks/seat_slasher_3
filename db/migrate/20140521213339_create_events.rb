class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :event_description
      t.datetime :event_date_time
      t.integer :user_id
      t.string :venue_name
      t.integer :region_id
      t.string :venue_city
      t.string :venue_state
      t.string :section
      t.string :row
      t.string :seat_numbers
      t.integer :quantity
      t.float :asking_price
      t.float :face_value
      t.string :ticket_type
      t.text :delivery_notes
      t.text :notes

      t.timestamps

    end
  end
end
