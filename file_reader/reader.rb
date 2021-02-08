require 'csv'
class Reader 
    def self.parse(filePath)
        items = Array.new
        CSV.foreach(filePath) do |row|
          route = Hash[source: row[0], destination: row[1], weight: row[2]]
          items.push(route)
        end
        items
    end
end