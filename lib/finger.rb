require 'net/http'
require 'net/https'
require 'openssl'
 
https = Net::HTTP.new('www.islandsofmyth.org', 80)
https.verify_mode = OpenSSL::SSL::VERIFY_NONE
https.use_ssl = false
response = ""
https.start do |session|
req = Net::HTTP::Post.new('/3k/cgi/finger.c')
req.set_form_data({"name"=>ARGV[0]}, ';')
response = session.request(req).body
end
 
puts response
