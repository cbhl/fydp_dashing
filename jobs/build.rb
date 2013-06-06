require 'net/http'
require 'json'

SCHEDULER.every '30s', :first_in => 0 do |job|
  http = Net::HTTP.new('http://cryptkeeper-build.rosemary.home.myazuresky.com/')
  response = http.request(Net::HTTP::Get.new("/status.json"))
  json = JSON.parse(response.body)
  tests_pass = json["tests_pass"]
  if test_pass
      send_event('status', "PASS")
  else
      send_event('status', "BROKEN")
  end
  last_build_duration = json["last_build_duration"]
  if last_build_duration
      send_event('build-time', last_build_duration)
  end
  last_build = json["last_build"]
  if last_build
      send_event('last-build', last_build)
  end
  test_results = json["test_results"]
  if test_results
    test_results.map! do |key, value|
      { label: key, value: value ? "PASS" : "FAIL" }
    end

    send_event('test-status', {items: test_results.values})
  end
end
