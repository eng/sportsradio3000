require 'rubygems'
require 'bundler/setup'
require 'espn'

client = ESPN::Client.new(api_key: 'xcrr9vemtwr8u75msmg2sq8n')
headlines = client.headlines(method: 'top')
headlines.each do |headline|
  `pico2wave -w /home/pi/description.wav "#{headline.description}" && aplay /home/pi/description.wav`
end
