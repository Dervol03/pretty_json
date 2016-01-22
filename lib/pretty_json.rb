require 'json'

require 'pretty_json/version'

# Represents a pretty JSON string.
class PrettyJson

  # @param [String] input either a file path or a JSON string.
  # @return [String] pretty formatted JSON string.
  def initialize(input)
    @json = if File.exist?(input)
       JSON.pretty_unparse(JSON.parse(File.read(input)))
    else
      JSON.pretty_unparse(JSON.parse(input))
    end

  end
end
