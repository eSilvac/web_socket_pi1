# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'gps.csv'))
csv = CSV.parse(csv_text.scrub, headers: true)
csv.each do |row|
  lat = row['latitude(degree)']
  lng = row['longitude(degree)']
  speed = ( row['speed(m/s)'].to_f * 3600 ) / 1000
  if lat != nil && lng != nil
    t = Datum.new
    t.lat = lat
    t.lng = lng
    t.speed = speed
    t.save
    puts "saved"
  end
end

puts "There are now #{Datum.count} rows in the transactions table"
