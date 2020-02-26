require 'net/http'
require 'uri'
require 'json'

uri_all= URI.parse('https://bpdts-test-app.herokuapp.com/users') # all user
json_all = Net::HTTP.get(uri_all)
all_users = JSON.parse(json_all) #返ってきたjsonデータをrubyの配列に変換するためのライン

uri_london = URI.parse('https://bpdts-test-app.herokuapp.com/city/London/users') # london user
json_london = Net::HTTP.get(uri_london) # with NET::HTTP, call the API
london_users = JSON.parse(json_london) #返ってきたjsonデータをrubyの配列に変換するためのライン

# byebug

all_users.each do |user| User.create(
    user_id: user['id'],
    first_name: user['first_name'],
    last_name: user['last_name'],
    email: user['email'],
    ip_address: user['ip_address'],
    latitude: user['latitude'],
    longitude: user['longitude']
)
end

# for test. dummy data
u1001 = User.create(:user_id => 1001, :first_name => "Huddersfield", :last_name => "Station", :latitude => 53.648557, :longitude => -1.784449) # 163.48 mi and hence fail
u1002 = User.create(:user_id => 1002, :first_name => "Great Portland", :last_name => "Station", :latitude => 51.524262, :longitude => -0.143772) # 1.52 mi and hence pass
u1003 = User.create(:user_id => 1003, :first_name => "East Ilsley", :last_name => "", :latitude => 51.533576, :longitude => -1.289984) # 50.41 mi and hence fail

london_users.each do |london_user| Londonuser.create(
    user_id: london_user['id'],
    first_name: london_user['first_name'],
    last_name: london_user['last_name'],
    email: london_user['email'],
    ip_address: london_user['ip_address'],
    latitude: london_user['latitude'],
    longitude: london_user['longitude']
)
end

