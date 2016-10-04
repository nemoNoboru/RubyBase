require 'minitest/autorun'
require_relative '../lib/RubyBase.rb'

class RubyBase::Router
  get '/([^\/]+)' do |params|
    "hola mundo #{params[:match][1]}"
  end

  get '.+' do
    'Error'
  end
end

RubyBase.run
