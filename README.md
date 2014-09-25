# Etrstm35fin

Converters coordinates from Finnish ETRS-TM35FIN coordinate system into WGS84.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'etrstm35fin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install etrstm35fin

## Usage
For given north and east coordinates return latitude and longitude.

``` ruby
Etrstm35fin.to_wgs84(6711804, 240724)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/etrstm35fin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
