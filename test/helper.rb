RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'