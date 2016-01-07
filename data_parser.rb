require 'csv'

class DataParser

  def self.converted_data(filename, *fields)
    [].tap do |dataset|
      CSV.foreach(filename, headers: true, :header_converters => :symbol) do |row|
        dataset << row.to_hash.keep_if{|key, value| fields.include?(key)} unless row[:is_traffic] == '1'
      end
    end
  end

end
