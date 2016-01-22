require 'spec_helper'

describe PrettyJson do
  let(:valid_file)    { File.join(EXAMPLES_DIR, 'valid.json')   }
  let(:invalid_file)  { File.join(EXAMPLES_DIR, 'invalid.json') }
  let(:pretty_file)   { File.join(EXAMPLES_DIR, 'pretty.json')  }
  let(:valid_json)    { File.read(valid_file)                   }
  let(:invalid_json)  { File.read(invalid_file)                 }
  let(:pretty_json)   { File.read(pretty_file)                  }

  it 'has a version number' do
    expect(PrettyJson::VERSION).not_to be nil
  end

  context 'given a file name' do
    context 'file exists' do
      context 'file content is valid JSON' do
        it 'parses JSON from file content' do
          inst = described_class.new(valid_file)
          expect(inst.instance_variable_get('@json')).to eq(pretty_json)
        end
      end

      context 'file content is invalid' do
        it 'raises an JSON::ParserError' do
          expect{
            described_class.new(invalid_file)
          }.to raise_error(JSON::ParserError)
        end
      end
    end# file exists


    context 'file does not exist' do
      context 'string is valid JSON' do
        it 'parses JSON from string' do
          inst = described_class.new(valid_json)
          expect(inst.instance_variable_get('@json')).to eq(pretty_json)
        end
      end# string is valid JSON

      context 'string is invalid' do
        it 'raises a JSON::ParserError' do
          expect{
            described_class.new(invalid_json)
          }.to raise_error(JSON::ParserError)
        end
      end# string is invalid
    end# file does not exist

  end# given a file name
end
