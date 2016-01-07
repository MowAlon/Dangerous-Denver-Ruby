class Tabulator

  def self.tabulate(dataset, field = nil)
    ranked_data = Hash.new(0)
    dataset.each{|record| ranked_data[record[field]] += 1 if record[field]}
    ranked_data.sort_by{|address, incident_count| incident_count}.reverse#.first(5)
  end

end
