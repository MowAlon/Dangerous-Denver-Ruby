require './data_parser'
require './tabulator'
require 'benchmark'

tabulation_time = Benchmark.realtime do
  traffic_data = DataParser.converted_data('./data/traffic-accidents.csv')
  @traffic_addresses = Tabulator.tabulate(traffic_data, :incident_address)
  @traffic_neighborhoods = Tabulator.tabulate(traffic_data, :neighborhood_id)
  crime_data = DataParser.converted_data('./data/crime.csv')
  @crime = Tabulator.tabulate(crime_data, :neighborhood_id)
end

print_time = Benchmark.realtime do
  puts @traffic_addresses
  puts @traffic_neighborhoods
  puts @crime
end

puts "Data prep time: #{tabulation_time}"
puts "Total time with printing: #{tabulation_time + print_time}"
