require 'minitest/autorun'
require_relative '../lib/RubyBase.rb'
require_relative './sincro.rb'


class RubyBase::Router
  

  get '/statuses' do
    Status.all
  end

  get '/tasks/([^/]+)' do |params|
    if Status.where(name: params[:match][1]).exists?
      Status.where(name: params[:match][1]).first.tasks
    else
      "error, status not found"
    end
  end

  get '/' do
    Task.all
  end
end

RubyBase.run
