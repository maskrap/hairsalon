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
  # @clients = Client.all()
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  # @clients = Client.all()
  erb(:index)
end
