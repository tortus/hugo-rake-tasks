# Hugo Rake Tasks

Rake tasks for Hugo sites.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hugo-rake-tasks', git: 'https://github.com/tortus/hugo-rake-tasks.git'
```

And then execute:

    $ bundle

In your Rakefile:

```rake
require 'hugo-rake/tasks'

# If you want running "rake" to build the site:
task :default => "hugo:build"
```

## Usage

```sh
$ hugo rake:build
$ hugo rake:serve
$ hugo rake:clean
$ hugo rake:deploy
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

