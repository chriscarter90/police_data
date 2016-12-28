class AddIndexOnCrimeDate < ActiveRecord::Migration[5.0]
  def change
    add_index :crimes, :date
    add_index :crimes, :outcome
    add_index :crimes, :crime_type
  end
end
