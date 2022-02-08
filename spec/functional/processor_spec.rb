require 'spec_helper'

RSpec.describe 'Processor Test' do
  describe 'Process data' do
    let(:data) do
      [
        {
          first_name: 'Mckayla',
          city: 'Atlanta',
          birthdate: '1986-05-29'
        },
        { first_name: 'Elliot',
          city: 'New York City',
          birthdate: '1947-05-04' }
      ]
    end

    let(:args) do
      {
        array: data,
        order: :first_name,
        except_attrs: [:last_name]
      }
    end
    let(:processor) { Processor.new(args[:array], args[:order], args[:except_attrs]) }

    it 'normalize' do
      processor_people = processor.perform

      expect(processor_people).to eq ['Elliot, New York City, 5/4/1947', 'Mckayla, Atlanta, 5/29/1986']
    end
  end
end
