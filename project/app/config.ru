require 'sinatra/base'
require 'data_mapper'

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

DataMapper.setup(:default, {
  adapter: 'sqlite3',
  database: "#{Dir.pwd}/db/development.db"
})
Mapping.auto_migrate!
Mapping.create(name: 'test', map_to: 'mapping')

map('/mappings') { run MappingController }
map('/') { run HomeController }
