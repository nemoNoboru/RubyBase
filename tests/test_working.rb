require 'minitest/autorun'
require_relative '../lib/RubyBase.rb'


class RubyBase::Router
  @state = 0
  get '.+' do
    @state += 1
    "count: #{@state}"
  end
end

RubyBase.run
