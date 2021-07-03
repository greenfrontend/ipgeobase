# Ipgeobase

Wrapper around https://ip-api.com/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ipgeobase'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ipgeobase

## Usage

```ruby
require "ipgeobase"

ip_meta = Ipgeobase.lookup('8.8.8.8')

puts ip_meta.city # "Ashburn"
puts ip_meta.country # "United States"
puts ip_meta.countryCode # "US"
puts ip_meta.lat # "39.03"
puts ip_meta.lon # "-77.5"
```
