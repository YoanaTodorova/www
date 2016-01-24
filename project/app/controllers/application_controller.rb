require 'sinatra/base'
require 'haml'

class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  # don't enable logging when running tests
  configure :production, :development do
    enable :logging
  end

  # will be used to display 404 error pages
  # not_found do
  #   title 'Not Found!'
  #   erb :not_found
  # end
end

class HomeController < ApplicationController
  helpers HomeHelper

  get '/' do
    haml :'home/index'
  end
end


class MappingController < ApplicationController
  get '/' do
    title "Example Page"
    erb :example
  end
end