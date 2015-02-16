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
  its(:value) { should <= 30 }>
end
```

## Contributing

1. Fork it ( https://github.com/rrreeeyyy/yard-serverspec-plugin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
