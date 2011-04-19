require 'rubygems'
require 'bundler'

Bundler.require

require File.dirname(__FILE__) + "/git-wiki"

config = YAML::load(File.read('config.yml'))

run GitWiki.new(config['repository'], config['extension'], config['homepage'])
