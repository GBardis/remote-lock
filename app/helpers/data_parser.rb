class DataParser
  attr_accessor :data, :delimiter, :data_array

  def initialize(data, delimiter)
    @data = data
    @delimiter = delimiter
    @data_array = []
  end

  def parse
    @data_array = data.split("\n")
    to_array_of_hashes
  end

  private

  def headers
    @data_array[0].split(delimiter).map(&:strip)
  end

  def body
    @data_array[1..].map {|x| x.split(delimiter).map(&:strip)}
  end

  def to_array_of_hashes
    body.map { |line| headers.map(&:to_sym).zip(line).to_h }
  end
end
