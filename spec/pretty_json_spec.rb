require 'spec_helper'

describe PrettyJSON do
  let(:valid_file)    { File.join(EXAMPLES_DIR, 'valid.json')   }
  let(:invalid_file)  { File.join(EXAMPLES_DIR, 'invalid.json') }
  let(:pretty_file)   { File.join(EXAMPLES_DIR, 'pretty.json')  }
  let(:valid_json)    { File.read(valid_file)                   }
  let(:invalid_json)  { File.read(invalid_file)                 }
  let(:pretty_json)   { File.read(pretty_file)                  }

  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
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
      context 'argument is a ruby Hash' do
        it 'unparses the Hash to JSON' do
          hash = JSON.parse(valid_json)
          inst = described_class.new(hash)
          expect(inst.instance_variable_get('@json')).to eq(pretty_json)
        end
      end# argument is a ruby Hash

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


  context 'instance methods' do
    subject{ described_class.new(valid_json) }

    describe '#to_s' do
      it 'return pretty JSON as string' do
        expect(subject.to_s).to eq(pretty_json)
      end
    end# #to_s


    describe '#to_file' do
      it 'writes pretty JSON to specified file' do
        out_file = File.join(OUTPUT_DIR, 'out.json')
        expect(File.exist?(out_file)).to be false

        expect(subject.to_file(out_file)).to eq(pretty_json)

        expect(File.exist?(out_file)).to be true
        expect(File.read(out_file)).to eq(pretty_json)
      end
    end# #to_file
  end# instance methods
end
