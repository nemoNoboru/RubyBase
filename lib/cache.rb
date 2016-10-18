# to save pre-processed json on memory.
module RubyBase
  module Cache
    @data = {}

    def self.proxy(method, route, block, params)
      if [:POST,:PUT,:DELETE].include?(method)
        @data = {}
        return Yajl::Encoder.encode(block.call(params))
      else
        temp = "#{route}-#{method}"
        ret = @data[temp]
        if ret
          return ret
        else
          response = Yajl::Encoder.encode(block.call(params))
          @data[temp] = response
          return response
        end
      end
    end
  end
end
