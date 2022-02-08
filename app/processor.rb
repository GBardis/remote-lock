class Processor
  attr_accessor :array, :people, :order, :except_attrs

  def initialize(array, order, except_attrs)
    @array = array
    @order = order
    @except_attrs = except_attrs
  end

  def perform
    convert_to_people(array)
    normalize_people
  end

  private

  def normalize_people
    PeopleNormalizer.new(@people, order, except_attrs: except_attrs).convert
  end

  def convert_to_people(array)
    @people = array.map { |x| People.new(x) }
  end
end
