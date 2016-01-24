require 'sinatra/base'
require 'data_mapper'

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

require './db/setup'
require './db/migrate'
require './db/seed'

map('/mappings') { run MappingController }
map('/') { run HomeController }
