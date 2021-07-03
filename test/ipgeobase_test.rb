# frozen_string_literal: true

require "test_helper"

RESPONSE = <<-FOO
<?xml version="1.0" encoding="UTF-8"?>
<query>
    <status>success</status>
    <country>United States</country>
    <countryCode>US</countryCode>
    <region>VA</region>
    <regionName>Virginia</regionName>
    <city>Ashburn</city>
    <zip>20149</zip>
    <lat>39.03</lat>
    <lon>-77.5</lon>
    <timezone>America/New_York</timezone>
    <isp>Google LLC</isp>
    <org>Google Public DNS</org>
    <as>AS15169 Google LLC</as>
    <query>8.8.8.8</query>
</query>
FOO

class IpgeobaseTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_lookup_success
    stub_request(:get, "http://ip-api.com/xml/8.8.8.8")
      .to_return(body: RESPONSE)

    ip_meta = Ipgeobase.lookup('8.8.8.8')

    assert_equal ip_meta.city, "Ashburn"
    assert_equal ip_meta.country, "United States"
    assert_equal ip_meta.countryCode, "US"
    assert_equal ip_meta.lat, "39.03"
    assert_equal ip_meta.lon, "-77.5"
  end
end
