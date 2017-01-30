require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/brand")
require("./lib/store")
require("pg")

get("/") do
  erb(:index)
end

get("/stores") do
  @stores = Store.all()
  erb(:stores)
end

post("/stores") do
  name = params.fetch("name")
  store = Store.new({:name => name})
  store.save()
  @stores = Store.all()
  erb(:stores)
end

get("/store/:id") do
  @store = Store.find(params.fetch("id").to_i())
  erb(:store)
end

post("/brands") do
  name = params.fetch("brand_name")
  description = params.fetch("brand_description")
  store_id = params.fetch("store_id").to_i()
  brand = Brand.new({:name => name, :store_id => store_id, :description => description})
  brand.save()
  @store = Store.find(store_id)
  erb(:store)
end

get("/store_edit/:id") do
  @store = Store.find(params.fetch("id").to_i())
  erb(:store_edit)
end

patch("/stores/:id") do
  name = params.fetch("name")
  @store = Store.find(params.fetch("id").to_i())
  @store.update({:name => name})
  erb(:store)
end

delete("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete()
  @stores = Store.all()
  erb(:stores)
end

get("/brand_edit/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  erb(:brand_edit)
end

patch("/brands/:id") do
  name = params.fetch("name")
  description = params.fetch("description")
  brand = Brand.find(params.fetch("id").to_i())
  brand.update({:name => name, :description => description})
  @stores = Store.all()
  erb(:stores)
end

delete("/brands/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.delete()
  @stores = Store.all()
  erb(:stores)
end
