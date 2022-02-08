# frozen_string_literal: true

class PeopleNormalizer
  attr_accessor :people, :order, :except_attrs

  def initialize(people, order, except_attrs: [])
    @people = people
    @order = order
    @except_attrs = except_attrs
    remove_attributes unless except_attrs.empty?
    sort
  end

  def convert
    people.map { |p| p.values.join(', ') }
  end

  private

  def sort
    @people = people.sort_by { |v| v[order] }
  end

  def remove_attributes
    @people = people.map { |p| p.to_hash.reject! { |key| except_attrs.include?(key) } }
  end
end
