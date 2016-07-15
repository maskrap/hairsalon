require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

delete('/stylists/delete/') do
  @stylist = Stylist.find(params.fetch('stylist_id').to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end

patch('/stylists/update/:id') do
  title = params.fetch("title")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:title =>title})
  erb(:stylist)
end

get('/clients') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

post('/stylists') do
  name = params.fetch('name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylist = stylist
  @stylists = Stylist.all()
  erb(:index)
end
