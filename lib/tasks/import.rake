namespace :import do
  desc "Import all data"
  task all:  :environment do
    CrimeImporter.import
  end
end
