# PrettyJson

<a href="https://codeclimate.com/github/Dervol03/pretty_json"><img src="https://codeclimate.com/github/Dervol03/pretty_json/badges/gpa.svg" /></a>  <a href="https://travis-ci.org/Dervol03/pretty_json"><img src="https://travis-ci.org/Dervol03/pretty_json.svg?branch=master" /></a>

This gem provides a simple interface to get pretty formatted JSON. It either can be used in a project or via the command line. When included in code, it provides the possibility to return the formatted JSON as string or to directly store it in a file. The latter option is not provided in the command line tool as you can refer to your favourite shell's file redirection for that purpose.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pretty_json'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pretty_json

## Usage

### In your own code

Simply require it wherever you which to use it:
```ruby
require 'pretty_json'
```

Afterwards, you have the `PrettyJSON` class at your disposal. You may pass a ruby Hash, String or a file name to the constructor.

```ruby
json = PrettyJSON.new('{"key": "value", "array":[1,2,3]}')
json.to_s                           #=> pretty formatted JSON
json.to_file('/tmp/example.json')   #=> writes pretty JSON to /tmp.example.json
```

### On the command line

If you only need quick formatting for some JSON, there are three possibilities to do so using the command line tool:

1. save your JSON in a file and pass the file name to the command line tool

    ```shell
    pretty_json example.json
    ```

2. pass the JSON as a single line to the command line tool:

    ```shell
    pretty_json '{"key": "value", "array":[1,2,3]}'
    ```

    Beware the single quotes around the JSON string. If they are omitted, the shell interpreter will split the string as it thinks correct, which will result in invalid JSON in most cases

3. you may pass multiline via STDIN using the `-` option

    ```shell
    pretty_json - > /tmp/example.json
    {"key": "value",
     "array":[1,2,3]}
    ```

    Here, the single quotes may be omitted. The example also shows how to write the result into a file (`/tmp/example.json`)instead of being printed to STDOUT.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Dervol03/pretty_json.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## Latest Changes

### 1.0.1

- Improved README markdown

