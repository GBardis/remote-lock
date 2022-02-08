require 'spec_helper'

RSpec.describe 'People Normalize Test' do
  describe 'normalize people data' do
    let(:people) do
      [
        People.new({
                     city: 'LA', birthdate: '30-4-1974',
                     last_name: 'Nolan', first_name: 'Rhiannon'
                   }),
        People.new({
                     city: 'NYC', birthdate: '5-1-1962',
                     last_name: 'Bruen',
                     first_name: 'Rigoberto'
                   })
      ]
    end

    let(:args) do
      {
        people: people,
        order: :first_name,
        except_attrs: [:last_name]
      }
    end
    let(:people_normalizer) { PeopleNormalizer.new(args[:people], args[:order], except_attrs: args[:except_attrs]) }

    it 'normalize' do
      normalized_people = people_normalizer.convert

      expect(normalized_people).to eq ['Rhiannon, Los Angeles, 4/30/1974', 'Rigoberto, New York City, 1/5/1962']
    end
  end
end
