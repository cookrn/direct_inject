require 'coffee_script'

path = File.dirname __FILE__

env = Sprockets::Environment.new
env.append_path "#{ path }/assets/images"
env.append_path "#{ path }/assets/javascripts"
env.append_path "#{ path }/assets/stylesheets"

LOCAL_SPROCKETS = env
