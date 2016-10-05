require 'yajl'
require_relative './cache.rb'

module RubyBase
  class Router
    @@cache = true

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
          if @@cache
            return RubyBase::Cache::proxy(method, route, @@data[method][key], params)
          end
          # non cached version
          return Yajl::Encoder.encode(@@data[method][key].call(params))
        end
      end
      return Yajl::Encoder.encode("Error, no route")
    end
  end
end
