require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

require("sinatra/activerecord")

get('/') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

post("/store_names") do
  @id = params[:id]
  @name = params["name"]
  @stores = Store.new({:name => @name, :id => nil})
  if @stores.save()
    redirect ('/')
  else
erb(:errors)
  end
end

post("/brand_names") do
  @id = params[:id]
  @brand = params["brand"]
  @price = params["price"]
  @brands = Brand.new({:brand => @brand, :id => nil, :price => @price})
  if @brands.save()
    redirect ('/')
  else
erb(:errors)
  end
end

get("/each_store/:id/") do
  @store =Store.find(params.fetch("id").to_i())
  @brands = Brand.all()
  erb(:store_edit)
end

patch("/update_store_name/:id") do
  name = params.fetch("name")
  @store = Store.find(params.fetch("id").to_i())
  @store.update({:name => name})
  erb(:store_edit)
end

delete("/store_delete/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete()
   redirect('/')
end

get("/each_brand/:id/") do
  @brand = Brand.find(params.fetch("id").to_i())
  @stores = Store.all()
  erb(:brand_update)
end

patch("/update_brand_name/:id") do
  id = params.fetch("id")
  brand = params.fetch("brand")
  price = params.fetch("price")
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.update({:brand => brand, :price => price, :id => id})
  erb(:brand_update)
end


patch("/stores_add_brand/:id") do
  store_id = params.fetch("id").to_i()
  @store = Store.find(store_id)
  brand_ids = params.fetch("brand_ids")
  @store.update({:brand_ids => brand_id})
  @brands = Brand.all()
  erb("store_edit")
end
