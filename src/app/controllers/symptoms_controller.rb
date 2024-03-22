require 'uri'
require 'net/http'

url = URI("https://diagnosis.p.rapidapi.com/api/DDxItems/GetSymptoms?AuthenticationID=DEMO_AuthenticationID")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = '295a130e1bmshcdaf6dae8992433p140e63jsn55a74ff77d09'
request["X-RapidAPI-Host"] = 'diagnosis.p.rapidapi.com'

response = http.request(request)
puts response.read_body
