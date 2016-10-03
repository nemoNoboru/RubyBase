require 'eventmachine'
require 'evma_httpserver'
require_relative 'router.rb'

module RubyBase

  class Reactor < EM::Connection
    include EM::HttpServer


    def process_http_request
      @router ||= RubyBase::Router.new
      response = EM::DelegatedHttpResponse.new(self)
      response.status = 200
      response.content_type 'text/javascript'
      response.content = @router.route(@http_request_method.to_sym, @http_request_uri, @http_post_content)
      response.send_response
    end
  end

  def self.run
    EventMachine.run {
      EventMachine.start_server "127.0.0.1", 8081, RubyBase::Reactor
    }
  end
end
