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
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
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
  @clients = Client.all
  erb(:index)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylists = Stylist.all
  @clients = Client.all
  erb(:stylist)
end

post('/stylists/:id') do
  client_name = params.fetch('client_name')
  client = Client.new({:name => client_name, :stylist_id => 1, :id => nil})
  client.save()

  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylists = Stylist.all
  @client = Client.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:stylist)
end
