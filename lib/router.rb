# clase que se encarga del routing de RubyBase
# recive la data de eventmachine como argumento de la funcion route.

class RubyBase::Router
  @data = {
    gets: {}
    posts: {}
    puts: {}
    deletes: {}
  }

  class << self
    def get(arg,&block)
      @data['gets'][arg] = block
    end

    def post(arg,&block)
      @data['posts'][arg] = block
    end

    def put(arg,&block)
      @data['puts'][arg] = block
    end

    def delete(arg,&block)
      @data['deletes'][arg] = block
    end
  end

  def route(data)
    return (@data[data.method][data.route].call).to_json
  end
end
