require 'dm-core'
require 'dm-migrations'

class Mapping
  include DataMapper::Resource
  property :id, Serial
  property :name, Text, required: true
  property :map_to, Text, required: true
  
  DataMapper.freeze
end

# class Number
#   include DataMapper::Resource
#   property :id, Serial
#   property :name, Text, required: true
#   property :female
#   property :male
#   property :neutral
#   property :map_to, Text, required: true
  
#   DataMapper.freeze
# end

# class Year
#   include DataMapper::Resource
#   property :id, Serial
#   property :name, Text, required: true
#   property :map_to, Text, required: true
  
#   DataMapper.freeze
# end


