require 'yaps/actions/creation'
require 'yaps/actions/destruction'
require 'yaps/actions/updation'
require 'yaps/publisher'
require "yaps/version"

module Yaps
  # Your code goes here...
  module Model
    extend ActiveSupport::Concern
    included do
      include Publisher
    end
  end
end
