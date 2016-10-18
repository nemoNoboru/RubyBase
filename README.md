# RubyBase
A fast and hackable JSON API engine based on EventMachine to be used as a backend for Angular, Ember , Etc...

# Highlights
- Fast. Like, Reaally fast [view more in performance][performance].
- Simple
- Few moving parts, just 100 lines of code.
- Hackable
- Cache system embbebed.
- Sinatra-like DSL
- Regexps all the way.
- Production ready (no configuration needed)
- Pure ruby (dependencies have native extensions)


# Usage
```ruby
require 'RubyBase'

# reopen the Router class
class RubyBase::Router
  get '/hello' do
    "Hello world!"
  end
  # 127.0.0.1/hello
  #=> "Hello world!"
end
```
What you return in the block is automatically parsed to JSON and sent to the client

# Usage #2: POST data
``` ruby
class RubyBase::Router
  post '/hello' do |r|
    puts r[:post]
  end
end
```
r[:post] is the post data sent by the client already parsed from JSON

# Usage #3: Dinamic Urls
``` ruby
class RubyBase::Router
  get '/hello/([^/]+)' do |r|
    "Hello world!" * (r[:match][1]).to_i
  end
  # 127.0.0.1/hello/2
  #=> "Hello world! Hello world!"
end
```

# RubyBase Matching system
RubyBase reads your routes from top to bottom and tries to match all of them
until some route matches the route requested by the client. That r[:match] is
the MatchData generated from the matching.

# RubyBase Cache system
When a 'GET' request is fulfilled and processed it is saved on cache. The next time
that the client request that exact route in the exact method it will automatically
receieve the cached response.
If a request with a method different from GET (POST,PUT,PATCH,DELETE) is made
**ALL CACHE IS DELETED** and all the caching starts again.


If you want, you can disable the cache system entirely by adding this

```ruby
class RubyBase::Router
  @@cache = false
end
```

# Hacking RubyBase
 - Read the code
 - Re-Open desired classes as you did with RubyBase::Router
 - Implement/Change desired behavior
 - Profit!

# Contributing
RubyBase is a small and simple thing. And i have no plans in making it the **NEW SOLUTION
FOR ALL THINGS TM** RubyBase *tries* to solve **one** problem and *tries* to do it well. Don't try to
bloat it with new "maybe usefull" features.
That said i think that RubyBase needs an Authorization system in order to have some **Sessions**
Right now i have little free time to do it so if you want to help try implementing that.
Just send pull requests commenting what you have done.

# Issues and known problems
If you have a problem pull a issue in this repo commenting what is going wrong.
Check this list first so you don't report an already known problem.


Known problems:
 - No way of modifying response HTTP Header (IE 404 errors can't be made)
 - No session system.
 - No Auth system.
