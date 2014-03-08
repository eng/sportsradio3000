require 'rubygems'
require 'bundler/setup'
require 'open-uri'
require 'espn'

client = ESPN::Client.new(api_key: 'xcrr9vemtwr8u75msmg2sq8n')
headlines = client.headlines(method: 'top')
headlines.each do |headline|
  `mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.com/translate_tts?tl=en&q=$#{URI.escape(headline.description)}"`
  # `pico2wave -w /home/pi/description.wav "#{headline.description}" && aplay /home/pi/description.wav`
end
