#!/usr/bin/ruby

# This class is from the book...
class ActsAsCsv
  def read
    file = File.new(self.class.to_s.downcase + '.txt')
    @headers = file.gets.chomp.split(', ')
    file.each do |row|
      @result << row.chomp.split(', ')
    end
  end
  
  def headers
    @headers
  end
  
  def csv_contents
    @result
  end
  
  def initialize
    @result = []
    read
  end
end
 
# I'm overriding it now as requested
class RubyCsv < ActsAsCsv
  attr_accessor :rows
  def initialize
    super
    @rows = []
    @result.each do |values|
       @rows << CsvRow.new(@headers, values)
    end
  end

  def each &block
    @rows.each &block
  end
end  

class CsvRow
  attr_accessor :headers, :values

  def initialize(headers, values)
    @headers = headers
    @values = values
  end
 
  def method_missing(name, *args)
    return @values[@headers.index(name.to_s)]
  end
end
 
csv = RubyCsv.new
csv.each { |row| puts row.one}
