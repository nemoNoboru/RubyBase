require 'yajl'

module RubyBase
  class Router
    @@data = {
      GET: {},
      POST: {},
      PUT: {},
      DELETE: {}
    }

    def self.get(arg,&block)
      @@data[:GET][arg] = block
    end

    def self.post(arg,&block)
      @@data[:POST][arg] = block
    end

    def self.put(arg,&block)
      @@data[:PUT][arg] = block
    end

    def self.delete(arg,&block)
      @@data[:DELETE][arg] = block
    end

    def route(method,route,post_data)
      return Yajl::Encoder.encode(@@data[method][route].call)
    end
  end
end
