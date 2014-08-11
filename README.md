# RB

irb, shorthand.

## Installation

Add this line to your application's Gemfile:

    gem 'rb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rb

## Usage

```
$ rb --help
Usage: rb [options]
    -f, --filter                     Filter lines from STDIN, as `line`
    -a, --apply                      Apply commands to lines from STDIN, as `line`
    -j, --json [OPTIONAL]            Preprocess input or ouput as JSON

$ rb 1 + 1
2

$ ls | rb -a '"file: #{line}"'
file: Gemfile
file: LICENSE.txt
file: README.md
file: Rakefile
file: bin
file: lib
file: rb.gemspec

$ ls | rb -f 'line == "Gemfile"'
Gemfile

$ ls | bin/rb -a --json output '{ basename: File.basename(line), extname: File.extname(line) }'
{"basename":"Gemfile","extname":""}
{"basename":"LICENSE.txt","extname":".txt"}
{"basename":"README.md","extname":".md"}
{"basename":"Rakefile","extname":""}
{"basename":"bin","extname":""}
{"basename":"lib","extname":""}
{"basename":"rb.gemspec","extname":".gemspec"}
```

## Contributing

1. Fork it ( https://github.com/jpb/rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Author

[James Brennan](jamesbrennan.ca)

## Thanks

Inspired by [phythonpy](https://github.com/Russell91/pythonpy).
