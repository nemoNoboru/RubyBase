require 'minitest/autorun'
require_relative '../lib/RubyBase.rb'

class RubyBase::Router
  get '/' do
    'hola mundo'
  end
end

RubyBase.run
