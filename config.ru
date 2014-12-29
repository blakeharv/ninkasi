#\ -s puma
# encoding: utf-8

require File.expand_path("../config/boot.rb", __FILE__)

use Rack::Deflater

run Padrino.application
