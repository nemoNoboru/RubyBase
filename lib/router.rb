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
      @@data[:GET][Regexp.new arg] = block
    end

    def self.post(arg,&block)
      @@data[:POST][Regexp.new arg] = block
    end

    def self.put(arg,&block)
      @@data[:PUT][Regexp.new arg] = block
    end

    def self.delete(arg,&block)
      @@data[:DELETE][Regexp.new arg] = block
    end

    def route(method,route,post_data)
      params = {}
      params[:post] = post_data
      @@data[method].each_key do |key|
        t = key.match(route)
        if t
          params[:match] = t
          return Yajl::Encoder.encode(@@data[method][key].call(params))
        end
      end
      return Yajl::Encoder.encode("Error, no route")
    end
  end
end
