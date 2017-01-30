require("rspec")
require("pg")
require("brand")
require("store")
require("pry")

DB = PG.connect({:dbname => "company_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM brands *;")
    DB.exec("DELETE FROM stores *;")
  end
end
