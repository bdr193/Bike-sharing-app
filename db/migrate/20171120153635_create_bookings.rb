class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.boolean :is_available
      t.date :start_date
      t.date :end_date
      t.integer :amount
      t.references :bike, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
