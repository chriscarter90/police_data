require "csv"

class CrimeImporter
  class << self
    def import
      Dir.glob(Rails.root.join("data", "2016-*", "2016-*-metropolitan-*.csv")) do |filename|
        print "Parsing: #{filename.split("/").last}..."
        CSV.foreach(filename, headers: true) do |row|
          Crime.create!(
            date:         Date.parse("#{row.fetch("Month")}-01"),
            reported_by:  row.fetch("Reported by"),
            falls_within: row.fetch("Falls within"),
            lat:          row.fetch("Latitude"),
            lng:          row.fetch("Longitude"),
            location:     row.fetch("Location"),
            crime_type:   row.fetch("Crime type"),
            outcome:      row.fetch("Last outcome category")
          )
        end
        puts " #{CSV.read(filename, headers: true).count} row(s) imported."
      end
    end
  end
end
