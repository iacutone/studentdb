# config.ru

require 'rubygems'
require 'sinatra'
require './app.rb'

run Sinatra::Application

$stdout.sync = true