#!/usr/bin/env ruby
require 'httparty'
require 'json'

endpoint="https://api.alpaca.markets/v2/account"
key="FAKE"
secret="ALSOFAKE"

def httparty_get(key,secret,url)
  response = HTTParty.get(
    url,
    headers: {
    'Content-Type' => 'application/json',
    'APCA-API-KEY-ID' => key,
    'APCA-API-SECRET-KEY' => secret 
  })
  return response
end

result= httparty_get(key,secret,endpoint)
puts result


