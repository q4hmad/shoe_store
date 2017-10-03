require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

require("sinatra/activerecord")

get('/') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

post("/") do
  @name = params["name"]
  @stores = Store.new({:name => @name, :id => nil})
  @stores.save()
  @stores = Store.all()
    erb(:index)
end

get('/store_edit/:id') do
  @stores = Store.find(params[:id].to_i())
  erb(:store_edit)
end

get('/store_edit') do
  erb(:store_edit)
end
