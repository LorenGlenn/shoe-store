ENV['RACK_ENV'] = 'test'
require('rspec')
require('sinatra/activerecord')
require('brand')
require('store')

RSpec.configure do |config|
  config.before(:each) do
    Brand.destroy_all
    Store.destroy_all
  end
end
