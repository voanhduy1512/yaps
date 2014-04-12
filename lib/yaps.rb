require 'wisper'
require 'yaps/actions/creation'
require 'yaps/actions/destruction'
require 'yaps/actions/updation'
require 'yaps/configuration'
require 'yaps/publisher'
require 'yaps/subscriber'
require "yaps/version"

begin
  require "pry"
rescue LoadError
end

module Yaps
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
