#!/usr/bin/ruby

require 'net/http'
require 'uri'

url = URI.parse 'http://www.islandsofmyth.org'
response = Net::HTTP.start(url.host, url.port) { |http| http.get('/3k/cgi/guildtree.c?name=list') }

regex = Regexp.new(/<td><a href="guildtree.c\?name=(\S*)">([a-zA-Z ]*)<\/a><\/td>/)

response_str = response.body

guilds = {}

matchdata = regex.match(response_str)
while matchdata
  guilds[matchdata[1].to_sym] = matchdata[2]
  response_str = matchdata.post_match
  matchdata = regex.match(response_str)
end

guilds.each_pair do |k,v|
  response = Net::HTTP.start(url.host, url.port) { |http| http.get('/3k/cgi/guildtree.c?name=' + k.to_s) }

  filename = 'guild_files/' + k.to_s + '.txt'
  filename.gsub!(/\+/, '_')

  puts "Writing #{filename}..."

  file = File.new(filename, 'w+')
  if file
    file.syswrite(response.body)
  end
  file.close
end
