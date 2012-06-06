require 'sinatra/base'
require 'json'
require 'digest/md5'
require 'date'

class App < Sinatra::Base
  get '/founders' do
    content_type :json

    @founders = {
      "Apple"     => ["Steve Jobs", "Steve Wozniak", "Ronald Wayne"],
      "Dribbble"  => ["Dan Cederholm", "Rich Thornett"],
      "GitHub"    => ["Tom Preston-Werner", "Chris Wanstrath", "PJ Hyett"],
      "Heroku"    => ["James Lindenbaum", "Adam Wiggins", "Orion Henry"],
      "Gowalla"   => ["Josh Williams", "Scott Raymond"],
      "Square"    => ["Jack Dorsey", "Tristan O'Tierney", "Jim McKelvey"],
      "Twitter"   => ["Jack Dorsey", "Biz Stone", "Evan Williams"]
    }

    # Specify response freshness policy for HTTP caches (Cache-Control header).
    #
    # See RFC 2616 / 14.9 for more on standard cache control directives:
    # http://tools.ietf.org/html/rfc2616#section-14.9.1
    cache_control :public, :must_revalidate, :max_age => 86400

    # Set the last modified time of the resource (HTTP 'Last-Modified' header)
    # and halt if conditional GET matches.
    #
    # When the current request includes an 'If-Modified-Since' header that is
    # equal or later than the time specified, execution is immediately halted
    # with a '304 Not Modified' response.
    last_modified Date.today

    # Set the response entity tag (HTTP 'ETag' header) and halt if conditional
    # GET matches. The value argument is an identifier that uniquely
    # identifies the current version of the resource.
    #
    # When the current request includes an 'If-None-Match' header with a
    # matching etag, execution is immediately halted.
    #
    # If the request method is GET or HEAD, a '304 Not Modified'.
    # response is sent.
    etag Digest::MD5.hexdigest(@founders.to_s)
    
    # Sleep in order to demonstrate effect of client-side caching.
    # The first request will be slow, but if the client is obeying caching
    # directives, subsequent requests will be nearly instantaneous.
    sleep 5
    
    return @founders.to_json
  end
end