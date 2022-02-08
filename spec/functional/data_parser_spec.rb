require 'spec_helper'

RSpec.describe 'Data parse Test' do
  describe 'parse data and convert to people' do
    let(:args) do
      {
        data: File.read('spec/fixtures/people_by_dollar.txt'),
        delimiter: '$'
      }
    end

    let(:data_parser) { DataParser.new(args[:data], args[:delimiter]) }

    it 'parses input files with dollar delimiter and outputs people data' do
      parsed_data = data_parser.parse

      expect(parsed_data).to eq [
        {
          city: 'LA', birthdate: '30-4-1974',
          last_name: 'Nolan', first_name: 'Rhiannon'
        },
        {
          city: 'NYC', birthdate: '5-1-1962',
          last_name: 'Bruen',
          first_name: 'Rigoberto'
        }
      ]
    end

    it 'parses input files with percent delimiter and outputs people data' do
      args[:data] = File.read('spec/fixtures/people_by_percent.txt')
      args[:delimiter] = '%'
      parsed_data = data_parser.parse

      expect(parsed_data).to eq [
        {
          first_name: 'Mckayla',
          city: 'Atlanta',
          birthdate: '1986-05-29'
        },
        { first_name: 'Elliot',
          city: 'New York City',
          birthdate: '1947-05-04'
        }
      ]
    end
  end
end
