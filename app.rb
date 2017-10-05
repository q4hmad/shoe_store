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

get("/each_brand/:id/") do
  @brand = Brand.find(params.fetch("id").to_i())
  @stores = Store.all()
  erb(:store_edit)
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
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

get("/each_brand/:id") do
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
    @store = Store.find(params.fetch('id').to_i)
    brand_ids = params.fetch('brand_ids')
    @brands = Brand.all()
    brand_ids.each do |b|
     brand = Brand.find(b)
     @store.brands.push(brand)
   end
  erb(:store_edit)
end

patch("/brand_add_store/:id") do
    @brand = Brand.find(params.fetch('id').to_i)
    store_ids = params.fetch('store_ids')
    @stores = Store.all()
    store_ids.each do |s|
     store = Store.find(s)
     @brand.stores.push(store)
    end
  erb(:brand_update)
end
