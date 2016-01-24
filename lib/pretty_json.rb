require 'json'

require 'pretty_json/version'

# Represents a pretty JSON string.
class PrettyJSON

  # @param [String] input either a file path or a JSON string.
  def initialize(input)
    json_hash = send("#{input.class.name.downcase}_to_hash", input)
    @json = JSON.pretty_unparse(json_hash)
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


  private

  def hash_to_hash(hash)
    hash
  end


  def string_to_hash(string)
    json = File.exist?(string) ? File.read(string) : string
    JSON.parse(json)
  end

end
