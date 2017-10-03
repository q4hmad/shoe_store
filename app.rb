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

get('/each_store/:id/') do
  @store = Store.find(params.fetch('id'))
  erb(:store_details_page)
end

get("/each_store/:id/edit") do
  @store =Store.find(params.fetch("id").to_i())
  erb(:store_details_page)
end
