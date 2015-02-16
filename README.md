# Yard::Serverspec::Plugin

This plugin adds [Serverspec](http://serverspec.org/) specs to YARD output.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yard-serverspec-plugin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yard-serverspec-plugin

## Usage

Add comments to your specs.

```
# @param kernel.panic Kernel behaviour on panic: delay
# @note default: 0 (wait forever). Check 30 seconds before rebooting.
context linux_kernel_parameter('kernel.panic') do
  its(:value) { should <= 30 }
end
```

You're ready to go:

```
yardoc -e yard-serverspec spec/*_spec.rb
```

or You can do this by adding the following to your ``Rakefile``:

```
namespace :doc do
  begin
    require 'yard'
    require 'yard/rake/yardoc_task'
    require 'yard/serverspec/plugin'
  rescue LoadError
    raise 'YARD is not available. Try installing it.'
  end
  YARD::Config.load_plugin('serverspec-plugin')
  YARD::Rake::YardocTask.new do |t|
    t.files = ['spec/*_spec.rb']
  end
end
```

and type:

```
rake doc:yard
```

then, you can see doc:

![example-doc](https://dl.dropboxusercontent.com/u/80830728/yard-serverspec-plugin/kernel-panic.png)

## Contributing

1. Fork it ( https://github.com/rrreeeyyy/yard-serverspec-plugin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
