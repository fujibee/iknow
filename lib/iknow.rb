module Iknow
end

require 'date'
require 'net/https'
require 'uri'

require 'rubygems'
require 'json'
require 'rexml/document'

require 'ext/hash'
require 'iknow/core'
require 'iknow/rest_client'
require 'iknow/model'

Iknow::Config.init
