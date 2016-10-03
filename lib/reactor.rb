# Clase de eventmachine que tiene como objetivo procesar peticiones HTTP

require 'eventmachine'
require 'evma_httpserver'

class RubyBase::Reactor < EM::Connection
  include EM::HttpServer

  def initialize(router,header)
    # Puede que no se pueda usar el metodo initialize 
    @router = router
    #? implementar cache en headers?
  end

  def process_http_request
    response = EM::DelegatedHttpResponse.new(self)
    response.status = 200
    response.content_type = 'text/javascript'
    response.content = @router.route(@http_request_method, @http_request_uri, @http_post_content)
    response.send_response
  end
end

# setup de eventmachine aqui
EventMachine.run {
  EventMachine.start_server "127.0.0.1", 8081, RubyBase::Reactor
}
