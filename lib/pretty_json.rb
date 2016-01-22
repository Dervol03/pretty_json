require 'json'

require 'pretty_json/version'

# Represents a pretty JSON string.
class PrettyJson

  # @param [String] input either a file path or a JSON string.
  def initialize(input)
    @json = if File.exist?(input)
       JSON.pretty_unparse(JSON.parse(File.read(input)))
    else
      JSON.pretty_unparse(JSON.parse(input))
    end
  end


  # @return [String] pretty formatted JSON.
  def to_s
    @json
  end

  # Writes pretty formatted JSON to the specified file and returns the same
  # content as a string.
  #
  # @param [String] out_file to be written.
  # @return [String] pretty formatted JSON.
  def to_file(out_file)
    File.write(out_file, @json)
    @json
  end
end
