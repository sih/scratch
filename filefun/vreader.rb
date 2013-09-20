require "csv"

# Handy CSV stuff
# sid
class VReader
  
  # Read each row and print to stdout
  def self.printRows(fileName="names.csv")
    CSV.foreach(fileName) do |row|
      puts row
    end
  end
  
  # Output as a hash keyed by a particular row
  # Row positions begin at 0
  def self.asHash(fileName="names.csv",indexPos=0)
    keyedRows = {}
    CSV.open(fileName) do |rowsOfRows|
      rowsOfRows.each do |row|
        keyedRows[row[indexPos]]=row
      end
    end
    keyedRows
  end
  
  # Find row numbers where there are uneven number of items. 
  # The first row is taken as gospel
  # The output is the bad line number (starts from 1) and the row
  def self.uneven(fileName="badNames.csv")
    badRows = {}
    CSV.open(fileName) do |rowsOfRows|
      correctCount = rowsOfRows.first.length
      index = 2 # (have consumed the first line anyway)
      rowsOfRows.each do |row| 
        badRows[index]=row.join(",") if row.length != correctCount
        index +=1
      end
    end
    badRows
  end
  
end


#VReader.printRows

puts VReader.asHash("names.csv",1)
puts VReader.uneven