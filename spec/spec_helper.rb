$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pretty_json'

EXAMPLES_DIR = File.join(__dir__, 'example_files')
OUTPUT_DIR   = File.join(__dir__, 'output')

RSpec.configure do |config|
  config.before(:each) do
    Dir.entries(OUTPUT_DIR).reject{ |dir| dir.start_with?('.') }.each do |file|
      File.delete(File.join(OUTPUT_DIR, file))
    end
  end
end