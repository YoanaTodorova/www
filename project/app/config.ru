require 'sinatra/base'
require 'data_mapper'

require './services/parser/number.rb'
require './services/parser/cardinal_number.rb'
require './services/parser/ordinal_number.rb'
require './services/parser/year.rb'
require './services/parser/rules.rb'
require './services/parser/main.rb'

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

require './db/setup'
require './db/migrate'
require './db/seed'

map('/mappings') { run MappingController }
map('/') { run HomeController }
