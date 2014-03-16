require 'rubygems'
require 'bundler/setup'
require 'open-uri'
require 'espn'

client = ESPN::Client.new(api_key: 'xcrr9vemtwr8u75msmg2sq8n')
headlines = client.headlines(method: 'top')
headlines.each do |headline|
  # Google Translate sounds much better. But limited to 100 characters.
  # `mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.com/translate_tts?tl=en&q=$#{URI.escape(headline.description)}"`

  # pico2wave doesn't sound as good. But can do whatever.
  # `pico2wave -w /home/pi/description.wav "#{headline.description}" && aplay /home/pi/description.wav`

  # "say" works on OS X
  `say "#{headline.description}"`
end
