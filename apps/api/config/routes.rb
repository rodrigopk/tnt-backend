# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
