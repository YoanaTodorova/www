require 'dm-core'
require 'dm-migrations'

class Mapping
  include DataMapper::Resource
  property :id, Serial
  property :name, Text, required: true
  property :map_to, Text, required: true
  
  DataMapper.freeze
end