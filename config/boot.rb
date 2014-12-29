# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development' unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

# Uncomment to allow debugging
# Setting for logger: https://www.padrinorb.com/api/Padrino/Logger.html
# PADRINO_LOGGER = { :development => { :log_level => :devel }}

# Set gems dependencies for environment
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

# Add your before (RE)load hooks here
Padrino.before_load do
end

# Add your after (RE)load hooks here
Padrino.after_load do
end

# Boot Padrino
Padrino.load!