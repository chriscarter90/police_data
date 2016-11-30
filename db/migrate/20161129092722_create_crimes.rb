class CreateCrimes < ActiveRecord::Migration[5.0]
  def change
    create_table :crimes do |t|
      t.date :date, null: false
      t.string :reported_by, null: false
      t.string :falls_within, null: false
      t.decimal :lat, null: true
      t.decimal :lng, null: true
      t.string :location, null: true
      t.string :crime_type
      t.string :outcome
    end
  end
end
