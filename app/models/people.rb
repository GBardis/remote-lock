# frozen_string_literal: true

require 'date'

class People
  attr_accessor :first_name, :last_name, :city, :birthdate

  def initialize(args)
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @city = CityMapper::CITY_CODES[args[:city].to_sym] || args[:city]
    @birthdate = Date.parse(args[:birthdate]).strftime('%-m/%-d/%Y')
  end

  def to_hash
    hash = {}
    instance_variables.each { |var| hash[var.to_s.delete('@').to_sym] = instance_variable_get(var) }
    hash
  end
end
