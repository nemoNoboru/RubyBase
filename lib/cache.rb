# to save pre-processed json on memory.
require 'digest'

module RubyBase
  module Cache
    @data = {}

    def self.proxy(method, route, block, params)
      if ['POST','PUT','DELETE'].include? method
        @data = {}
        return block.call(params)
      else
        temp = Digest::MD5.digest("#{route}-#{method}")
        ret = @data[temp]
        if ret
          #puts "CACHED"
          return ret
        else
          response = Yajl::Encoder.encode(block.call(params))
          #puts "CACHE SAVED"
          @data[temp] = response
          return response
        end
      end
    end
  end
end
