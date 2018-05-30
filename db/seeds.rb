# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Viaje2(Part-1).csv'))
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
    t.train = "TN-2"
    t.save
    puts "saved"
  end
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Viaje2(Part-2).csv'))
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
    t.train = "TN-2"
    t.save
    puts "saved"
  end
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Viaje1(Part-1).csv'))
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
    t.train = "TN-1"
    t.save
    puts "saved"
  end
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Viaje1(Part-2).csv'))
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
    t.train = "TN-1"
    t.save
    puts "saved"
  end
end

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'gps(malo).csv'))
# csv = CSV.parse(csv_text.scrub, headers: true)
# csv.each do |row|
#   lat = row['lat']
#   lng = row['lng']
#   speed = 20
#   if lat != nil && lng != nil
#     t = Datum.new
#     t.lat = lat
#     t.lng = lng
#     t.speed = speed
#     t.train = "TN-1"
#     t.save
#     puts "saved"
#   end
# end


puts "There are now #{Datum.count} rows in the transactions table"
