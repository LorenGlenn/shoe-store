require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/brand')
require('./lib/store')

get("/") do
  erb(:index)
end

get("/stores") do
  @stores = Store.all()
  erb(:stores)
end

get("/brands") do
  @brands = Brand.all()
  erb(:brands)
end

post("/stores") do
  name = params.fetch("name")
  store = Store.new({:name => name})
  if store.save()
    erb(:success)
  else
    erb(:errors)
  end
end

get("/store/:id") do
  @store = Store.find(params.fetch("id").to_i())
  erb(:store)
end

post("/brands") do
  name = params.fetch("name")
  description = params.fetch("description")
  brand = Brand.new({:name => name, :description => description})
  if brand.save()
    erb(:success)
  else
    erb(:errors)
  end
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

get("/brand/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  erb(:brand)
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
  @brand = brand
  erb(:brand)
end

delete("/brands/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.delete()
  @stores = Store.all()
  erb(:stores)
end
