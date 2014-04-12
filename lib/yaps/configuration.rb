module Yaps
  class Configuration
    attr_accessor :enable

    def enable?
      return enable
    end

    def initialize
      @enable = true
    end
  end
end
