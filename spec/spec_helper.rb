ENV['RACK_ENV'] = 'test'
require("rspec")
require('sinatra/activerecord')
require("brand")
require("store")
require("pry")


# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM brands *;")
#     DB.exec("DELETE FROM stores *;")
#   end
# end
