# frozen_string_literal: true

require_relative "ipgeobase/version"
require "addressable/template"
require "happymapper"
require "net/http"

module Ipgeobase
  class Error < StandardError; end

  class Metadata
    include HappyMapper
    tag 'query'

    element :country, String, tag: 'country'
    element :countryCode, String, tag: 'countryCode'
    element :region, String, tag: 'region'
    element :regionName, String, tag: 'regionName'
    element :city, String, tag: 'city'
    element :zip, String, tag: 'zip'
    element :lat, String, tag: 'lat'
    element :lon, String, tag: 'lon'
    element :timezone, String, tag: 'timezone'
    element :isp, String, tag: 'isp'
    element :org, String, tag: 'org'
  end

  def self.lookup(ip)
    template = Addressable::Template.new("http://ip-api.com/xml/{ip}")
    uri = template.expand({"ip" => ip})

    res = Net::HTTP.get_response(uri)

    Metadata.parse(res.body)
  end
end
